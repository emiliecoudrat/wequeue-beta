class Line < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :comments, through: :posts

  validates :place, :city, :address, :date, :user_id, presence: true
end

