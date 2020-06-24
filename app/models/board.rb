class Board < ApplicationRecord
	belongs_to :user
	has_many :board_categories
	has_many :categories, through: :board_categories
	has_many :responses, dependent: :destroy
	
end
