class Room < ActiveRecord::Base
	extend FriendlyId
 
 	has_many :reviews,:dependent => :destroy
 	has_many :reviewed_rooms, :through => :reviews, :source => :room
 	
	belongs_to :user
	attr_accessible :description, :location, :title, :picture

	validates_presence_of :title, :slug, :location
	validates_length_of :description, :minimum => 30, :allow_blank => false

	mount_uploader :picture, PictureUploader
	friendly_id :title , use: :slugged

	scope :most_recent, order('created_at desc')

	def complete_name
		"#{title} #{location}"
	end

	def self.search(query)
		if query.present?
			where(['location like :query OR
				title like :query OR
				description like :query', :query => "%#{query}%"])
		else
			scoped
		end
	end
end
