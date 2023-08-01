class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :topic, null: false, foreign_key: true
      t.text :content
      t.text :image

      t.timestamps
    end
  end
end
