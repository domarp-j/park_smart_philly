class User < ApplicationRecord

  has_secure_password
  has_many :activities, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy

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

  def create_activity_from_parking_violation(parking_violation)
    activity = self.activities.build
    activity.post_time = DateTime.now

    activity.body = "#{self.username} just submitted a parking violation! "
    activity.body += "The violation occured at #{parking_violation.location}. "
    activity.body += "The violation was issued at #{parking_violation.issue_date_time}. "

    unless parking_violation.description.nil? || parking_violation.description.empty?
      activity.body += "#{self.username} was fined for #{parking_violation.description}. "
    end

    unless parking_violation.fine.nil?
      activity.body += "#{self.username} was fined  $#{parking_violation.description}! "
    end

    activity.body += "We thank #{self.username} for his bold sacrifice!"

    activity.save!
  end

end
