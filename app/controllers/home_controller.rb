class HomeController < ApplicationController
  def controls
    @pump_status = PumpStatus.last
    @new_status  = PumpStatus.new

    if @pump_status.operating_at > 0
      @new_status.operating_at = 0
      @submit_text = "Disable Pumps"
    else
      @new_status.operating_at = 80
      @submit_text = "Enable Pumps"
    end

    if user_signed_in?
      render :operate
    else
      render :monitor
    end
  end

  def operate
    PumpStatusAccumulateJob.perform_now
    @pump_status = PumpStatus.last
    @pump_status.update operating_at: params[:pump_status][:operating_at]

    redirect_to root_url
  end
end
