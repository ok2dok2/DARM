class AddImageToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :image, :text
  end
end
