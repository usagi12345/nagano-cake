class Admins::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
  	@order_item = OrderItem.find(params[:id])
    @order_item.update(order_detail_params)
    # OrderItem after_update => 注文ステータスの自動更新
    redirect_to admins_order_path(@order)
  end

  private
  def order_detail_params
  	params.require(:order_item).permit(:production_status)
  end

end
