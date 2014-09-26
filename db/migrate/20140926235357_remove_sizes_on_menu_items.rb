class RemoveSizesOnMenuItems < ActiveRecord::Migration
  def change
    remove_column :menu_items, :size_id
  end
end
