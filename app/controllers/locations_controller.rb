class LocationsController < ApplicationController

  def new
    @location = Location.new
    render :home
  end

  def create
    @location = Location.new(strong_location_params)
    @location.get_latitude
    @location.get_longitude

    if @location.save
      flash[:success] = "Here are your results."
      redirect_to location_path(@location)
    else
      flash[:error] = "We could not generate results."
      render :new
    end
  end

  def show
    render :home
  end

  private

    def strong_location_params
      params.require(:location).permit(:address)
    end

end
