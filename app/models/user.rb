class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"

  has_many :eventusers, foreign_key: "attendee_id"
  has_many :attended_events, through: :eventusers, source: :attended_event

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :sender_id
  has_many :received_invitations, class_name: "Invitation", foreign_key: :receiver_id



  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.previous
  end
  
end
