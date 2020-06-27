class Response < ApplicationRecord
	belongs_to :user
	belongs_to :board

	validates :content, presence: true

	def self.ransackable_attributes(auth_object = nil)
    %w[content]
  end
	
end
