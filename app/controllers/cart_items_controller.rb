class CartItemsController < ApplicationController

  before_action :authenticate_end_user!
  before_action :set_item, only: [:create, :destroy, :destroy_all]
  before_action :set_user
  before_action :set_cart

  def index
     @items = @cart_item.items
  end

  def create
  	@item = @cart_item.items.build(item_id: params[:item_id]) if @item.blank?
    @item.number += params[:number].to_i
    if @item.save
      redirect_to current_cart
    else
      redirect_to controller: "items", action: "show"
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def update
    @cart_item.update(cart_item_params)
    redirect_to current_cart
  end

  def destroy_all
    @end_user.cart_items.destroy_all
    redirect_to current_cart
  end

  private
    def set_user
      @end_user = current_end_user
    end

    def set_item
      @item = current_cart_item.items.find_by(item_id: params[:item_id])
    end

    def set_cart
      @cart_item = current_cart
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :end_user_id, :number)
    end

  end
end

