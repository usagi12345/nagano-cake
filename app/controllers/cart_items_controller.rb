class CartItemsController < ApplicationController

  before_action :authenticate_end_user!

  def index
    @end_user = current_end_user
    @cart_items = @end_user.cart_items.all
  end

  def create
    @end_user = current_end_user
    @cart_item = current_end_user.cart_items.new(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id, end_user_id: @cart_item.end_user.id)
    if @current_item.nil?
      if @cart_item.save
        redirect_to cart_items_path
      else
        @carts_items = @end_user.cart_items.all
        render 'index'
      end
    else
      amount = @current_item.number + params[:cart_item][:number].to_i
      @current_item.update(number: amount)
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy_all
    @end_user = current_end_user
    @end_user.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :end_user_id, :number)
  end
end

