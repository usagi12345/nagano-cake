class CartItemsController < ApplicationController

  before_action :authenticate_end_user!

  def index
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	@cart_item.user_id = current_user.user_id
  	if @cart_item.save
  		redirect_to cart_item_path, notice: 'カートに入れました'
  	else
  		@item = Item.find(@cart_item.item.id)
  		render 'items/show'
  	end
  end

  def destroy
  end

  def update
  end

  def destroy_all
  end
end

