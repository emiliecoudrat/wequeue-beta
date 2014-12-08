class User < ActiveRecord::Base
  has_many :lines
  has_many :posts
  has_many :comments

  validates :first_name, :last_name, :email, presence: true
end
