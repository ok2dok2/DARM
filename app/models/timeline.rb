class Timeline < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy 
  validates :images, presence: true
  mount_uploaders :images, Image2Uploader
end
