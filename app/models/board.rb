class Board < ApplicationRecord
	belongs_to :user
	has_many :board_categories
	has_many :categories, through: :board_categories
	has_many :responses, dependent: :destroy

	validates :title, presence: true

	def self.search(search)
		if search
			Board.where(['title LIKE ?', "%#{search}%"])
			#Board.includes(:response).where(['title LIKE ? OR content LIKE ?',"%#{search}%", "%#{search}%"]).references(:response)
		else
			Board.all
		end
	end
	
end

