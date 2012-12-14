class Room < ActiveRecord::Base
 
	belongs_to :user
	attr_accessible :description, :location, :title

	validates_presence_of :title, :location
	validates_length_of :description, :minimum => 30, :allow_blank => false

	scope :most_recent, order('created_at desc')

	def complete_name
		"#{title} #{location}"
	end
end
