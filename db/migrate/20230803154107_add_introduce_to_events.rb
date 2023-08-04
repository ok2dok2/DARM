class AddIntroduceToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :introduce, :text
  end
end
