class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
end
