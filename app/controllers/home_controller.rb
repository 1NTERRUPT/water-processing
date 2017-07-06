class HomeController < ApplicationController
  def controls
    if user_signed_in?
      render :operate
    else
      render :monitor
    end
  end
end
