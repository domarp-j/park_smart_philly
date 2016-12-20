class ParkingViolation < ApplicationRecord

  validates :fine, numericality: true
  validates :location, :issue_date_time, :location_longitude, :location_latitude, presence: true

  def set_latitude_and_longitude # TODO: combine with location version, make abstract
    return false if location.nil?

    response = HTTParty.get(GoogleMapsAPI::build_geocode_api_request(location))
    geolocation_data = JSON.parse(response.body)
    return false if geolocation_data.nil?

    self.location_latitude = GoogleMapsAPI::get_latitude(geolocation_data)
    self.location_longitude = GoogleMapsAPI::get_longitude(geolocation_data)
  end

end
