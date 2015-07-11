class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise 	:database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable

	validates :birthday, :presence => true
	validates :user_name, :presence => true, :uniqueness => { :case_sensitive => false }

	# Virtual attribute for authenticating by either user_name or email
	# This is in addition to a real persisted field like 'user_name'
	attr_accessor :login

	def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_h).first
      end
    end

end