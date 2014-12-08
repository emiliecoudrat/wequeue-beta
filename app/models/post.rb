class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :line
  has_many :comments

  validates :description, :user_id, :line_id, presence: true
end
