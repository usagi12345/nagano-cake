class Admins::EndUsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = EndUser.page(params[:page]).per(10)
  end

  def show
    @user = EndUser.find(params[:id])
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_end_users_path
    else
      render :edit
    end
  end

 private

 def user_params
  params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone, :email, :is_deleted)
 end
end
