class Genre < ApplicationRecord

	validates :name, presence: true
	validates :stock, presence: true


  has_many :items, dependent: :destroy

end
