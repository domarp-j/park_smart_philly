
# These methods uses the Google Maps API to get certain bits of information.
# Details on the API can be found here:
# https://developers.google.com/maps/

require 'pry-byebug'

module GoogleMapsAPI

  def build_geocode_api_request(address)
    request = "https://maps.googleapis.com/maps/api/geocode/json?address="
    address_array = address.split(' ')
    address_array.each do |term|
      request += "#{term}+"
    end
    request += "philadelphia+pa&key=#{ENV["GOOGLE_MAPS_API_KEY"]}"
  end

  def get_latitude(response)
    return nil if response["results"].empty?
    lat = response["results"][0]["geometry"]["location"]["lat"]
  end

  def get_longitude(response)
    return nil if response["results"].empty?
    lng = response["results"][0]["geometry"]["location"]["lng"]
  end

end
