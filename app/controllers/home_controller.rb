class HomeController < ApplicationController
  def controls
    @pump_status = PumpStatus.last
    if user_signed_in?
      render :operate
    else
      render :monitor
    end
  end
end
