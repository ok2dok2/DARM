class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, on: :create
  acts_as_taggable
  has_many :events, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follow_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :follower
  has_many :passive_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follow
  mount_uploaders :images, ImageUploader

  def first_image
    images.first&.url
  end

  def follow!(other_user)
    active_relationships.create!(follower_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(follower_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(follower_id: other_user.id).destroy
  end

end
