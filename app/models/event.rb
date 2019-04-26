class Event < ApplicationRecord
     belongs_to :creator, class_name: "User"


     has_many :eventusers, foreign_key: "attended_event_id"
     has_many :attendees, through: :eventusers, source: :attendee

     has_many :invitations
     has_many :invited_users, through: :invitations, source: :receiver

    scope :upcoming, -> { where("date > ?", Time.now) }
    scope :previous, -> { where("date < ?", Time.now) }





     # default_scope -> { order(created_at: :desc) }

     validates :creator_id, presence: true
     validates :name, presence: true, length: {minimum: 3 }
     validates :dateofevent, presence: true
     validates :location, presence: true


     def can_invite?(user)
      self.attendees.exclude?(user) && self.invited_users.exclude?(user) && self.creator != user
    end

end
