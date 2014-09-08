require 'rails_helper'

feature 'admin section' do
  context 'adding menu items' do
    scenario 'an admin can add a chef special menu item' do
      create_categories
      create_menu_types
      visit '/admin'
      click_link 'Add Menu Item'
      expect(page).to have_content 'Add Menu Item'
      fill_in 'menu_item[name]', with: 'Sesame Chicken'
      fill_in 'menu_item[description]', with: 'Chicken, sesame, spicy'
      fill_in 'menu_item[price]', with: '9.95'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Chef Special', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      expect(page).to have_content 'Sesame Chicken was successfully added'
      expect(page).to have_content 'Add Menu Item'
      visit '/menu'
      within '.chef-special-container' do
        expect(page).to have_content 'Chef Special'
        expect(page).to have_content 'Sesame Chicken'
        expect(page).to have_content 'Chicken, sesame, spicy'
        expect(page).to have_content '$9.95'
      end
    end
  end
end