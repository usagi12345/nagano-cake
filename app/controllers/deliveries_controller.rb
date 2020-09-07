class DeliveriesController < ApplicationController

  before_action :authenticate_end_user!

  def index
  	@delivery = Delivery.new
  	@deliveries = current_end_user.deliveries.all
  end

  def create
  	@delivery = current_end_user.deliveries.new(delivery_params)
  	if @delivery.save
  		redirect_to request.referer
  	else
  		render :index
  	end
  end

  def edit
  	@delivery = Delivery.find(params[:id])
  end

  def update
  	@delivery = Delivery.find(params[:id])
  	if @delivery.update(delivery_params)
  		redirect_to deliveries_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@delivery = Delivery.find(params[:id])
  	@delivery.destroy
  	redirect_to deliveries_path
  end

  private

  def delivery_params
  	params.require(:delivery).permit(:name, :postal_code, :address)
  end

end
