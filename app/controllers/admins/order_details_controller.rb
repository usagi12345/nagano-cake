class Admins::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
  	@order_item = OrderItem.find(params[:order_item][:id])
    @order_item.update(order_detail_params)
    # OrderItem after_update => 注文ステータスの自動更新
    redirect_to request.referer
  end

  private
  def order_detail_params
  	params.require(:order_item).permit(:production_status)
  end

end
