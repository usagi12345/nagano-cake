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
  end

  def update
    if @order.order_items.production_status == 2
      @order.order_status = 2
      @order.update
    elsif @order.order_items.production_status == 3
        @order.order_status = 3
        @order.update
    else
    @order.update(order_params)
  end
  end

  private

  def orders_params
    params.require(:order).permit(:order_status)
  end

end
