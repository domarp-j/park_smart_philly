class ChangeNameOfViolationDescription < ActiveRecord::Migration[5.0]
  def change
    remove_column :parking_violations, :violation_description
    add_column :parking_violations, :description, :string
  end
end
