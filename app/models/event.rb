class Event < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  mount_uploader :image, ImageUploader
end
