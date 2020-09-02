class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(parmit[:id])
  end

  def new
  end

  def edit
  end
end
