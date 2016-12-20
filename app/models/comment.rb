class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User",
                      foreign_key: :author_id

  validates :body, :author_id, :post_time, presence: :true

end
