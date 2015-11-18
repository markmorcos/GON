class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :user_id, :post_id, :text

  def to_s
    text
  end
end
