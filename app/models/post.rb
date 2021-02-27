# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :comment, length: { maximum: 512 }
  validates :image, presence: true
  mount_uploader :image, ImagesUploader
end
