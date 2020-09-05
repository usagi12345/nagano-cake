class Admins::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@items = Item.page(params[:page]).per(10)
  end

  def show
  	@item = Item.find(params[:id])
    @price_tax = @item.price_nontax.to_i*1.1
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
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  end

  def update
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  	if @item.update(item_params)
  		redirect_to admins_items_path
  	else
  		render :edit
  	end
  end

 private

 def item_params
 	params.require(:item).permit(:genre_id, :name, :explanation, :price_nontax, :image, :sale_status)
 end
end