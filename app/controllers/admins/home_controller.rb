class Admins::HomeController < ApplicationController

  before_action :authenticate_admin!

	def top
		@orders = Order.where(created_at: Time.now.all_day)
	end

end

