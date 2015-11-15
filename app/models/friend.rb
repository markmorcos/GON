class Friend < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'other_user_id'

  validates_presence_of :user_id, :other_user_id
end
