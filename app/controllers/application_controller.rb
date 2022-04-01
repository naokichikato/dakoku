class ApplicationController < ActionController::Base
  include SessionsHelper
  require "date"

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
   
    def change(s)
      h = s.divmod(3600)
      m = h[1].divmod(60)
      return "#{h[0]}時間#{m[0]}分"
    end
    
end