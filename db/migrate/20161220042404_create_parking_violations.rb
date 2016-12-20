class CreateParkingViolations < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_violations do |t|
      t.float :fine
      t.datetime :issue_date_time
      t.string :location
      t.string :violation_description
      
      t.timestamps
    end
  end
end
