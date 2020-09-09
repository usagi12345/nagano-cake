class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_items, dependent: :destroy
  enum order_status:{ 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment:{ クレジットカード: 0, 銀行振込: 1 }
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment, presence: true
  

  def sum_price
    sum_all = 0
    #sum_all = 合計金額
    @cart_items.each do |cart_item|
    price_tax(cart_item.item.price_nontax)
    cart_item.number
    #sum_item = 小計
    sum_item = price_tax(cart_item.item.price_nontax).to_i * cart_item.number
    sum_all += sum_item
  end
  end
end

