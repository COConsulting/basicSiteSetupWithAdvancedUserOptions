class Company < ActiveRecord::Base

	validates :company_name, :presence => true
	validates :address_1, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true
	validates :zip_code, :presence => true

	belongs_to :user
end