class Admins::OrdersController < ApplicationController
include ApplicationHelper
  before_action :authenticate_admin!

  def index
  	@orders = Order.all
  	case params[:order_sort]
  	when "0"
  		@orders = Order.where(created_at: Date.today)
  	when "1"
  		@end_user = EndUser.find(params[:end_user_id])
  		@orders = @end_user_orders
  	else
  		@orders = Order.all
  end
end

  def show
  	@order = Order.find(params[:id])
  end
  def update
  	@order = Order.find(params[:id])
  	if @order.order_items.production_status == 2
  		@order.order_status = 2
  		@order.update
  	elsif @order.order_items.production_status == 3
	  		@order.order_status = 3
	  		@order.update
  	else
    @order.update(order_params)
	end
    redirect_to request.referer
  end

  private

  def orders_params
    params.require(:order).permit(:order_status)
  end

end
