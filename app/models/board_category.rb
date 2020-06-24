class BoardCategory < ApplicationRecord
	belongs_to :category, optional: true
	belongs_to :board, optional: true
end
