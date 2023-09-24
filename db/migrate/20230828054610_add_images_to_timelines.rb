class AddImagesToTimelines < ActiveRecord::Migration[6.1]
  def change
    add_column :timelines, :images, :json
  end
end
