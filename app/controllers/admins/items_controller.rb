class Admins::ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def new
  	@item = Item.new
  	@genres = Genre.all
  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	redirect_to admins_items_path
  end

  def edit
  end
end

 private

 def item_params
 	params.require(:item).permit(:genre_id, :name, :explanation, :price_nontax, :image, :sale_status)
 end
end