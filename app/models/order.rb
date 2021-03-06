class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_items, dependent: :destroy
  enum order_status:{ 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment:{ クレジットカード: 0, 銀行振込: 1 }
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment, presence: true

  after_update do
    if self.order_status == '入金確認'
      self.order_items.each do |order_item|
        order_item.update(production_status: '製作待ち')
      end
    end
  end

end

