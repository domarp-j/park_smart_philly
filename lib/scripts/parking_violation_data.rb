#!/usr/bin/env ruby

require 'soda/client'

client = SODA::Client.new({:domain => "data.phila.gov", :app_token => ENV["SOCRATA_APP_TOKEN"]})

results = client.get("2pfz-fnns")

puts "Got #{results.count} results for parking violation data."
puts "All data is stored in \"results\" array."
