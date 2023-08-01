class Post < ApplicationRecord
  belongs_to :topic
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
