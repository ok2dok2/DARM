class AddWordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :word, :string
  end
end
