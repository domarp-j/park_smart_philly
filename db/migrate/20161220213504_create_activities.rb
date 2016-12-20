class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.datetime :post_time, null: false
      
      t.timestamps
    end
  end
end
