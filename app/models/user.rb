class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :posts
  has_many :posts, class_name: 'Post', foreign_key: 'other_user_id'

  has_many :friends
  has_many :friends, class_name: 'User', foreign_key: 'other_user_id'
  
  has_many :comments
  has_many :likes

  validates_presence_of :first_name, :last_name

 class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not a valid email")
      end
    end
  end

  validates :email, email: true

  def to_s
    first_name + ' ' + last_name
  end
end