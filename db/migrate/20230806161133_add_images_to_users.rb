class AddImagesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :images, :json
  end
end
