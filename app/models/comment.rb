class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :post_id, :text

  def to_s
    text
  end
end
