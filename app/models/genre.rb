class Genre < ApplicationRecord

	validates :name, presence: true
	validates :is_valid, presence: true


  has_many :items, dependent: :destroy

end
