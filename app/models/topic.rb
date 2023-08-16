class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { is: 11, allow_blank: true }
  validates :image, presence: true
  belongs_to :user
  mount_uploader :image, Image2Uploader
end
