class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :line
  has_many :comments

  has_attached_file :picture,
    styles: { large:"500x500#", medium: "300x300#", thumb: "100x100#" },
    :s3_permissions => {
      :large => :public_read,
      :medium => :public_read,
      :thumb => :public_read
    }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  validates :description, :user_id, :line_id, presence: true

end
