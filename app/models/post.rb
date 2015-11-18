class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :other_user, class_name: 'User', foreign_key: 'other_user_id'

  has_many :comments
  has_many :likes
  
  validates_presence_of :user_id, :text

  attr_accessor :number_of_comments, :number_of_likes

  def number_of_comments
    comments.size()
  end

  def number_of_likes
    likes.size()
  end

  def to_s
    text
  end
end
