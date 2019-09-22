class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }
	# validate :add_error
	belongs_to :user


end
