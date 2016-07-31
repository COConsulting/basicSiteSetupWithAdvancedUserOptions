class Story < ActiveRecord::Base
	belongs_to :user
	
	validates :heading, :presence => true
	validates :body, :presence => true
	validates :locationCity, :presence => true
	validates :locationState, :presence => true
	validates :locationZip, :presence => true
	
	geocoded_by :locationZip
	after_validation :geocode
end
