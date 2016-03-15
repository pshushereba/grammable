class Gram < ActiveRecord::Base
	validates :messages, presence: true
	validates :picture, presence: true
	
	mount_uploader :picture, PictureUploader

	belongs_to :user
end
