class MeetingRequest < ActiveRecord::Base
  belongs_to :user
  has_many :meeting_request_users
end
