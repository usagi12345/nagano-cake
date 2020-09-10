class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@order = Order.page(params[:page]).per(10).order('create_at DESC')
  end

  def show
  	@order = Order.find(params[:id])
  end

end
