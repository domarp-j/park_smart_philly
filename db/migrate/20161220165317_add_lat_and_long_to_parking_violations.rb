class AddLatAndLongToParkingViolations < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_violations, :location_latitude, :float
    add_column :parking_violations, :location_longitude, :float
  end
end
