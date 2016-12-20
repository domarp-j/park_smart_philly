# This file provides the GoogleMaps API module in libs/apis/google_maps.
require File.expand_path('../../../lib/apis/google_maps', __FILE__)
include GoogleMapsAPI

# This gem calculates the distance between two lat/long coordinates.
require 'haversine'

class Location < ApplicationRecord

  validates :address, :time, :latitude, :longitude, presence: :true

  def set_time
    time = DateTime.now
  end

  def set_latitude_and_longitude
    return false if address.nil?

    response = HTTParty.get(GoogleMapsAPI::build_geocode_api_request(address))
    geolocation_data = JSON.parse(response.body)
    return false if geolocation_data.nil?

    self.latitude = GoogleMapsAPI::get_latitude(geolocation_data)
    self.longitude = GoogleMapsAPI::get_longitude(geolocation_data)
  end

  def nearby_violations(miles=1)
    delta = 0.005 * miles # TODO: definitely not exact...

    min_lat, min_lng = self.latitude - delta, self.longitude - delta
    max_lat, max_lng = self.latitude + delta, self.longitude + delta

    nearby_violations = ParkingViolation.where(
      "location_latitude BETWEEN ? and ?
      AND location_longitude BETWEEN ? and ?",
      min_lat, max_lat, min_lng, max_lng
    )
  end

end
