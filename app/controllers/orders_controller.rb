class OrdersController < ApplicationController

  before_action :authenticate_end_user!

  def index
  end

  def show
  end

  def new
    @end_user = current_end_user
    @order = Order.new
    @deliveries = current_end_user.deliveries.all
  end

  def confirm
    @end_user = current_end_user
    @order = Order.new
    @cart_items = @end_user.cart_items
    @order.payment = params[:order][:payment]
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1  #自分の住所
        @order.postal_code = @end_user.postal_code
        @order.address = @end_user.address
        @order.name = @end_user.first_name + @end_user.last_name
      when 2  #配送先一覧から選択
        @send = params[:order][:addresses].to_i
        @delivery_info = Delivery.find(@send)
        @order.postal_code = @delivery_info.postal_code
        @order.address = @delivery_info.address
        @order.name = @delivery_info.name
      when 3  #配送先の新規登録
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end
  end

  def create
  end

  def thanks
  end
end
