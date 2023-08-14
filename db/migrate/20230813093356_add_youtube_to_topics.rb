class AddYoutubeToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :youtube, :string
  end
end
