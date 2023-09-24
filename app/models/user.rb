class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, length: { maximum: 10 }, presence: true
  validates :password, presence: true, on: :create
  validates :age, length: { maximum: 2 }
  validates :word, length: { maximum: 15 }
  validates :introduce, presence: true
  acts_as_taggable
  has_many :events, dependent: :destroy
  has_many :timelines, dependent: :destroy
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

  def distance_to(other_user)
    return nil if latitude.nil? || longitude.nil? || other_user.latitude.nil? || other_user.longitude.nil?
    #これを書くことでnilであっても表示されるようになる
    earth_radius = 6371 # 地球の半径（キロメートル）
    lat1_rad = latitude * Math::PI / 180
    lon1_rad = longitude * Math::PI / 180
    lat2_rad = other_user.latitude * Math::PI / 180
    lon2_rad = other_user.longitude * Math::PI / 180

    dlat = lat2_rad - lat1_rad
    dlon = lon2_rad - lon1_rad

    a = Math.sin(dlat / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon / 2) ** 2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    distance = earth_radius * c
    distance.round(2) # 小数点2桁に丸める
    end

    def self.guest
      find_or_create_by!(email: 'guest@gmail.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = 'guest'
        user.introduce = 'guest'
      end
    end

    def self.guest_admin
      find_or_create_by!(email: 'guest.admin@gmail.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = 'gst admin'
        user.introduce = 'admin'
        user.admin = true
      end
    end


    
    private

    def validate_image_count
      # ここ最小,最大の画像枚数を指定
      min_images = 1
      max_images = 3
  
      # if image.size < min_images || image.size > max_images
      #   errors.add(:image, "画像の枚数は#{min_images}枚から#{max_images}枚にしてください")
      # end
    end

end
