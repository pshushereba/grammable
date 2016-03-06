class Gram < ActiveRecord::Base
	validates :messages, presence: true

	belongs_to :user
end
