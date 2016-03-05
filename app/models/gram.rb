class Gram < ActiveRecord::Base
	validates :messages, presence: true
end
