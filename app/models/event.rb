class Event < ApplicationRecord
     belongs_to :creator, class_name: "User"
     
     # has_many :eventusers, foreign_key: "attended_events_id"
     # has_many :attendees, through: :eventusers, source: :attendee



     # default_scope -> { order(created_at: :desc) }

     validates :creator_id, presence: true
     validates :name, presence: true, length: {minimum: 3 }
     validates :dateofevent, presence: true
     validates :location, presence: true

end
