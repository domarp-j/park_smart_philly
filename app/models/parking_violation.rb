class ParkingViolation < ApplicationRecord

  validates :fine, numericality: true
  validates :location, :issue_date_time, :location_longitude, :location_latitude, presence: true

end
