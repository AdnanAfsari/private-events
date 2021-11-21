# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :eventusers, foreign_key: 'attended_event_id'
  has_many :attendees, through: :eventusers, source: :attendee

  has_many :invitations
  has_many :invited_users, through: :invitations, source: :receiver

  scope :upcoming, -> { where('dateofevent > ?', Time.now) }
  scope :previous, -> { where('dateofevent < ?', Time.now) }

  # default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :dateofevent, presence: true
  validates :location, presence: true

  def can_invite?(user)
    attendees.exclude?(user) && invited_users.exclude?(user) && user != user
 end
end
