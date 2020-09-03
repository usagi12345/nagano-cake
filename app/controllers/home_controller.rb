class HomeController < ApplicationController

  def top
    @random = Item.order("RANDOM()").limit(4)
    @tax = 1.1
  end

  def about
  end
end

