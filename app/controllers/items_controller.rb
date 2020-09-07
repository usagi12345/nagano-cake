class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @cart_item = @item.cart_items.build
    @genres = Genre.all
  end

end