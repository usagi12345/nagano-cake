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
    @order.update(order_params)
    # Orderモデルの方でafter_update　＝＞製作ステータスの自動更新
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
