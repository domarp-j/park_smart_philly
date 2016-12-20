class Activity < ApplicationRecord

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, :author_id, :post_time, presence: :true

end
