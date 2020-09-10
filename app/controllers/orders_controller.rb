class OrdersController < ApplicationController

  before_action :authenticate_end_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
    @sum_all = OrderItem.all.sum("number * price")

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
    if current_end_user.cart_items.exists?
      @order = Order.new(order_params)
      @order.end_user_id = current_end_user.id

      # 住所のラジオボタン選択に応じて引数を調整
      @order.total_price = 0
      @order.save
      # send_to_addressで住所モデル検索、該当データなければ新規作成
      if Delivery.find_by(address: @order.address).nil?
        @delivery = Delivery.new
        @delivery.postal_code = @order.postal_code
        @delivery.address = @order.address
        @delivery.name = @order.name
        @delivery.end_user_id = current_end_user.id
        @delivery.save
      end
        current_end_user.cart_items.each do |cart_item|
          order_item = @order.order_items.new
          order_item.order_id = @order.id
          order_item.item_id = cart_item.item_id
          order_item.number = cart_item.number
          order_item.save
          cart_item.destroy #order_itemに情報を移したらcart_itemは消去
        end
        render :thanks
    else
      redirect_to root_path
    end
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :total_price)
  end
end