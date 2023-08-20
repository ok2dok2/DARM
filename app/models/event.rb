class Event < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  mount_uploader :image, Image2Uploader
  validates :introduce, presence: true
  validates :place, presence: true
  validates :contact, presence: true, length: { maximum: 25 }
  validates :name, presence: true, length: { maximum: 30 }
end
