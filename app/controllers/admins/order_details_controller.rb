class Admins::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
  	@order_item = OrderItem.find(params[:id])
    if @order_item.update(order_detail_params)
      redirect_to request.referer
    else
      render "admins/orders/#{:id}"
    end
  end

  private
  def order_detail_params
  	params.permit(:production_status)
  end

end
