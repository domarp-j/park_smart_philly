class ParkingViolationsController < ApplicationController

  def create
    @parking_violation = ParkingViolation.new(strong_parking_violation_params)

    if @parking_violation.save
      flash[:success] = "Thank you for helping us be better!"
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Sorry, we couldn't save that information."
      redirect_back fallback_locatin: root_path
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
