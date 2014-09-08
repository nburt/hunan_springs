class AddSizeToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :size_id, :integer
    add_index :menu_items, :size_id
  end
end
