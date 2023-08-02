class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :age, :integer
      add_column :users, :name, :string
      add_column :users, :image, :text
      add_column :users, :introduce, :string
      add_column :users, :admin, :boolean, default: false
  end
end
