class ReversingDateSplit < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_violations, :issue_date_time, :datetime

    remove_column :parking_violations, :issue_date
    remove_column :parking_violations, :issue_time
  end
end
