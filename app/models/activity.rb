class Activity < ApplicationRecord

  belongs_to :author, class_name: "User"

  validates :body, :author_id, :post_time, presence: :true

end
