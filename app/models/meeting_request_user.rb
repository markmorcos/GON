class MeetingRequestUser < ActiveRecord::Base
  belongs_to :meeting_request
  belongs_to :user

  scope :rejected, -> { where(accepted: -1) }
  scope :pending, -> { where(accepted: 0) }
  scope :accepted, -> { where(accepted: 1) }
end
