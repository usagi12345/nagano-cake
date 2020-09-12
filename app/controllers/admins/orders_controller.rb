class Admins::OrdersController < ApplicationController
include ApplicationHelper
  before_action :authenticate_admin!

  def index

  	@order = Order.all

  	case params[:order_sort]
  	when "0"
  		@orders = Order.where(created_at: Time.now.all_day)
  	else
  		@orders = Order.all
    end
  end

  def end_user_index
    @end_user = EndUser.find(params[:id])
    @orders = @end_user.orders.all
  end


  def show
  	@order = Order.find(params[:id])
    # binding.pry
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    # Orderモデルの方でafter_update　＝＞製作ステータスの自動更新
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
