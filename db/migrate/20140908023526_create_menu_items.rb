class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :menu_type_id
      t.index :menu_type_id
      t.integer :category_id
      t.index :category_id
      t.timestamps
    end
  end
end
