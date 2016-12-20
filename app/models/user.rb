class User < ApplicationRecord

  has_secure_password
  has_many :activities, foreign_key: :author_id, dependent: :destroy

  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :password, format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+{8,}\z/,
      message: "requires 8+ characters, uppercase, and lowercase letters."
    }

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

end
