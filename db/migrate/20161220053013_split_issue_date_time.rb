class SplitIssueDateTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :parking_violations, :issue_date_time

    add_column :parking_violations, :issue_date, :date
    add_column :parking_violations, :issue_time, :time
  end
end
