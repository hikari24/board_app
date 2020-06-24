class Category < ApplicationRecord
	has_many :board_categories
	has_many :boards, through: :board_categories
end
