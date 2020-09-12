class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order
  enum production_status:{ 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  validates :number, presence: true
  validates :price, presence: true

  after_update do
    order_items = self.order.order_items
    if order_items.any? {|order_item| order_item.production_status == "製作中"} == true
    # 条件分岐：製作ステータスが1つでも製作中にだったら
      self.order.update(order_status: "製作中") # 注文ステータスを製作中に変更する
    elsif order_items.all? {|order_item| order_item.production_status == "製作完了"} == true
    # 条件分岐：製作ステータスが全て製作完了だったら
    self.order.update(order_status: "発送準備中") # 注文ステータスを発送準備中に変更する
    end
  end


end
