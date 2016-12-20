require 'pry-byebug'

class LocationsController < ApplicationController

  def new
    @location = Location.new
    render :home
  end

  def create
    @location = Location.new(strong_location_params)
    @location.set_time
    @location.set_latitude_and_longitude

    if @location.save
      flash[:success] = "Successfully received location."
      redirect_to location_path(@location)
    else
      flash[:error] = "Could not receive location."
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
    @parking_violations = @location.nearby_violations(1)
    render :home
  end

  private

    def strong_location_params
      params.require(:location).permit(:address)
    end

end
