class ParkingViolationsController < ApplicationController

  def create
    @parking_violation = ParkingViolation.new(strong_parking_violation_params)
    @parking_violation.set_latitude_and_longitude

    if @parking_violation.save
      current_user.create_activity_from_parking_violation(@parking_violation)
      flash[:success] = "Thank you for helping us be better!"
      redirect_back fallback_location: root_path
    else
      fail
      flash[:error] = "Sorry, we couldn't save that information."
      redirect_back fallback_location: root_path
    end
  end

  private

    def strong_parking_violation_params
      params.require(:parking_violation).permit(
        :issue_date_time,
        :location,
        :description,
        :fine
      )
    end

end
