class Timeline < ApplicationRecord
  belongs_to :user
  validates :images, presence: true
  mount_uploaders :images, Image2Uploader
end
