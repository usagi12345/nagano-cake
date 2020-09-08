class Item < ApplicationRecord

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price_nontax, presence: true
  validates :image, presence: true
  validates :sale_status, presence: true

	attachment :image
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

end
