class Board < ApplicationRecord
	belongs_to :user
	has_many :board_categories
	has_many :categories, through: :board_categories
	has_many :responses, dependent: :destroy

	validates :title, presence: true

	def self.ransackable_attributes(auth_object = nil)
    	%w[title]
  	end
end

