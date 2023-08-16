class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :content, presence: true
  mount_uploader :image, Image2Uploader
end
