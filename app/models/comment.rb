class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :content, :post_id, :user_id, presence: true
end
