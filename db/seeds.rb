
# This file provides a method that gathers the data from the API.
# Data is gathered in JSON format.
require File.expand_path('../../lib/apis/parking_violation_data', __FILE__)

# This file provides the GoogleMaps API module in libs/apis/google_maps.
require File.expand_path('../../lib/apis/google_maps', __FILE__)
include GoogleMapsAPI

# JSON needed to parse data
require 'json'

# Delete all previous entries, for the purpose of seeding
puts "Destroying all previous parkring violation entries..."
ParkingViolation.destroy_all # TODO: truly necessary?

# Call the method provided by the file above, then store the data in "results".
results = parking_violation_data

# Create ParkingViolation objects from the data.
puts "Creating new parking violation entries from API data..."
puts "Note: this will take a while! Go grab some tea."
results.each do |result|

  # Get the latitude and longitude values for the address.
  # Sleep a bit so that the API doesn't take too many hits.
  violation_location = result["location"]
  next if violation_location.nil?
  response = HTTParty.get(build_geocode_api_request(violation_location))
  sleep(0.5)
  geolocation_data = JSON.parse(response.body)

  # Finally, the ParkingViolation instances are created.
  ParkingViolation.create(
    fine: result["fine"].to_f,
    issue_date_time: DateTime.parse(result["issue_date_and_time"]), # TODO: saves as UTC, but should be EST
    location: violation_location,
    location_latitude: get_latitude(geolocation_data),
    location_longitude: get_longitude(geolocation_data),
    description: result["violation_description"]
  )

end

# Finished!
puts "Done!"
