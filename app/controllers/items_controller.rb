class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show

  	@item = Item.find(params[:id])
  end
<<<<<<< HEAD
end
=======

end


>>>>>>> 9826e9cd086e81715a09a9241adfa057e60d4abb
