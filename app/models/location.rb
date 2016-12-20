class Location < ApplicationRecord

  # This file provides the GoogleMaps API module in libs/apis/google_maps.
  require File.expand_path('../../lib/apis/google_maps', __FILE__)
  include GoogleMapsAPI

end
