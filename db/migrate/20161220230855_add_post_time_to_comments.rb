class AddPostTimeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :post_time, :datetime, null: false
  end
end
