class MenuItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu_type
  belongs_to :size

  validates_presence_of :name, :description, :price, :menu_type_id, :category_id
  validates_uniqueness_of :name, scope: :menu_type_id
end
