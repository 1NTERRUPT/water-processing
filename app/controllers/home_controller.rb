class HomeController < ApplicationController
  def controls
    if user_signed_in?
      username = current_user.username
      if username == "operator"
        render :operate
      elsif username == "admin"
        render :administrate
      else
        render :monitor
      end
    else
      render :monitor
    end
  end
end
