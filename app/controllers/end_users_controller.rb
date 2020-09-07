class EndUsersController < ApplicationController

  before_action :authenticate_end_user!

  def show
    @user = current_end_user
  end

  def edit
  	@user = current_end_user
  end

  def update
    @user = current_end_user
     @user.update(end_user_params)
    redirect_to end_users_path
  end

  def withdraw
    @user = current_end_user
  end

  def index
  end

  def out
    @user = current_end_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def password_edit
    @user = current_end_user
  end
  def password_update
    @user = current_end_user
     @user.update(end_user_params)
    redirect_to end_users_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :email,  :phone, :is_deleted, :password)
end
end
