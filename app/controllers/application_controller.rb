class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

    def new_parking_violation
      @new_parking_violation = ParkingViolation.new
    end

end
