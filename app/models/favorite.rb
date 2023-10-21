class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :timeline

  validates_uniqueness_of :timeline_id, scope: :user_id
end
