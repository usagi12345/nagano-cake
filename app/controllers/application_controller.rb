class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  #セッションの作成
  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = CartItem.find_by(id: session[:cart_item_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart = CartItem.create unless current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_item_id] = current_cart_item.id
    # Cart情報を返却
    current_cart
  end

  protected

    def after_sign_in_path_for(resource)
      case resource
      when EndUser
        items_path
      when Admin
        admins_items_path
      end
        # Log_in後に遷移するpath
    end

    def after_sign_up_path_for(resource)
      case resource
      when EndUser
        items_path
      when Admin
        admins_items_path
      end  # Sign_Up後に遷移するpath
    end

    def after_sign_out_path_for(resource)
      new_end_user_session_path  #ログアウト後に遷移するpath
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :is_deleted, :phone])
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone])
  end
end
