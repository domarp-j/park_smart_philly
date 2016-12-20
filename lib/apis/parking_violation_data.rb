
# This method obtains parking violation data in Philadelphia from 2012 to 2015.
# using an API. The API can be found here:
# https://dev.socrata.com/foundry/data.phila.gov/2pfz-fnns

require 'soda/client'

def parking_violation_data
  client = SODA::Client.new({
    :domain => "data.phila.gov",
    :app_token => ENV["SOCRATA_APP_TOKEN"]
  })
  results = client.get("2pfz-fnns")
end
