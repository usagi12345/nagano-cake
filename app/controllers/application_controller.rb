class ApplicationController < ActionController::Base

  protected

    def after_sign_in_path_for(resource)
      items_path  # Log_in後に遷移するpath
    end

    def after_sign_up_path_for(resource)
      items_path  # Sign_Up後に遷移するpath
    end

    def after_sign_out_path_for(resource)
      new_end_user_session_path  #ログアウト後に遷移するpath
    end

end
