class AddIntroduceToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :introduce, :text
  end
end
