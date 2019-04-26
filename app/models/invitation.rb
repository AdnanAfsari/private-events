class Invitation < ApplicationRecord
  scope :not_accepted, -> { where(accepted: false) }
  belongs_to :event
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
