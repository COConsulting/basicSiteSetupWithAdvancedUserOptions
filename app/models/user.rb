class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise 	:database_authenticatable, :registerable, :omniauthable,
         	:recoverable, :rememberable, :trackable, :validatable

	validates :birthday, :presence => true
	validates :user_name, :presence => true, :uniqueness => { :case_sensitive => false }

	################################################
    ## Start section for User Name or Email Login ##
    ################################################

	attr_accessor :login

	def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_h).first
      end
    end

    ################################################
    ##  End section for User Name or Email Login  ##
    ################################################

    ################################################
    ##  Start section for OmniAuth Authorization  ##
    ################################################

    def self.from_omniauth(auth)
    	where(auth.slice(:provider, :uid)).first_or_create do |user|
    		user.provider = auth.provider
    		user.uid = auth.uid
    		user.user_name = auth.info.nickname
    	end
    end

    def self.new_with_session(params, session)
    	if session["devise.user_attributes"]
    		new(session["devise.user_attributes"], without_protection: true) do |user|
    			user.attributes = params
    			user.valid?
    		end
    	else
    		super
    	end
    end

    def password_required?
    	super && provider.blank?
    end

    def update_with_password(params, *options)
    	if encrypted_password.blank?
    		update_attributes(params, *options)
    	else
    		super
    	end
    end

    ################################################
    ##   End section for OmniAuth Authorization   ##
    ################################################
end