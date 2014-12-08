class Line < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :place, :city, :address, :date, :user_id, presence: true
end

