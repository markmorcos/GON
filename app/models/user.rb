class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :friends
  has_many :users, through: :friends
  has_many :inverse_friends, class_name: 'Friend', foreign_key: 'other_user_id'
  has_many :inverse_users, through: :inverse_friends, source: :user

  has_many :posts
  has_many :messages
  has_many :comments
  has_many :likes
  has_many :meeting_requests
  has_many :meeting_request_users
  
  attr_accessor :friends, :messages, :number_of_posts
  
  def friends
    Friend.where("user_id = ? OR other_user_id = ?", id, id)
  end

  def messages(other_user_id)
    Message.where("user_id = ? AND other_user_id = ? OR user_id = ? AND other_user_id = ?", id, other_user_id, other_user_id, id)
  end

  def number_of_posts
    posts.size()
  end

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not a valid email")
      end
    end
  end

  validates_presence_of :first_name, :last_name
  validates :email, email: true

  def to_s
    first_name + ' ' + last_name
  end
end
