class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :content, presence: true, unless: :image_present?
  mount_uploader :image, Image2Uploader

  def image_present?
    self.image.present?
  end
end
