class Board < ApplicationRecord
	belongs_to :user
	has_many :board_categories
	has_many :categories, through: :board_categories
	has_many :responses, dependent: :destroy

	def self.search(search)
		if search
			Board.where(['title LIKE ?', "%#{search}%"])
			#親モデル名.includes(:子モデル名).wh(['検索したいカラム名 LIKE ?  検索したい',"%#{search}%", "%#{search}%"]).references(:子モデル名)
		else
			Board.all
		end
	end
	
end

