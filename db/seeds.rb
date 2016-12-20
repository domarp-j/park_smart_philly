
# This file provides a method that gathers the data from the API.
# Data is gathered in JSON format.
require File.expand_path('../../lib/apis/parking_violation_data', __FILE__)

# Delete all previous entries, for the purpose of seeding
puts "Destroying all previous parkring violation entries..."
ParkingViolation.destroy_all # TODO: truly necessary?

# Call the method provided by the file above, then store the data in "results".
results = parking_violation_data

# Create ParkingViolation objects from the data.
puts "Creating new parking violation entries from API data..."
results.each do |result|

  # Finally, the ParkingViolation instances are created.
  ParkingViolation.create(
    fine: result["fine"].to_f,
    issue_date_time: DateTime.parse(result["issue_date_and_time"]), # TODO: saves as UTC, but should be EST
    location: result["location"],
    violation_description: result["violation_description"]
  )

end
