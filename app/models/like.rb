class Like < ActiveRecord::Base
  validates_presence_of :user_id, :post_id
end
