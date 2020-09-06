class OrdersController < ApplicationController

  before_action :authenticate_end_user!

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_end_user.cart.items
  end

  def thanks
  end
end
