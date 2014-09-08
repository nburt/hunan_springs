class MenuItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu_type
end
