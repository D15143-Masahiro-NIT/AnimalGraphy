class Post < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :comment, length: { maximum: 512 }
  validates :image, presence: true
  mount_uploader :image, ImagesUploader
end
