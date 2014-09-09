class MenuType < ActiveRecord::Base
  has_many :menu_items

  validates_presence_of :name
  validates_uniqueness_of :name
end
