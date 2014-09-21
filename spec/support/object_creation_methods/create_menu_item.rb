def create_menu_item(name = 'Sesame Chicken')
  visit '/admin/menu_items'
  click_link 'Add Menu Item'
  fill_in 'menu_item[name]', with: name
  fill_in 'menu_item[description]', with: 'Chicken, sesame, spicy'
  fill_in 'menu_item[price]', with: '9.95'
  select 'Dinner', from: 'menu_item[menu_type_id]'
  select 'Chef Special', from: 'menu_item[category_id]'
  click_button 'Create Menu Item'
end