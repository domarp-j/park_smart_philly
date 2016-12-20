
# This file provides a method that gathers the data from the API.
# Data is gathered in JSON format.
require File.expand_path('../../lib/apis/parking_violation_data', __FILE__)

# Call the method provided by the file above, then store the data in "results".
results = parking_violation_data

# Create ParkingViolation objects from the data.
results.each do |result|

  # Finally, the ParkingViolation instances are created.
  ParkingViolation.create(
    fine: result["fine"].to_f,
    issue_date_time:
    location: result["location"],
    violation_description: result["violation_description"]
  )

end
