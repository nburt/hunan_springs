require 'rails_helper'

feature 'admin section' do
  context 'adding menu items' do

    before do
      create_categories
      create_menu_types
    end

    scenario 'an admin can add a Chef Special menu item' do
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

    scenario 'an admin can add a Beef menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Mongolian Beef'
      fill_in 'menu_item[description]', with: 'Beef, other stuff'
      fill_in 'menu_item[price]', with: '8.50'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Beef', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      expect(page).to have_content 'Beef was successfully added'
      visit '/menu'
      within '.beef-container' do
        expect(page).to have_content 'Beef'
        expect(page).to have_content 'Mongolian Beef'
        expect(page).to have_content 'Beef, other stuff'
        expect(page).to have_content '$8.50'
      end
    end

    scenario 'an admin can add a Poultry menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Sweet and Sour Chicken'
      fill_in 'menu_item[description]', with: 'so sweet, so sour'
      fill_in 'menu_item[price]', with: '8.50'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Poultry', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.poultry-container' do
        expect(page).to have_content 'Poultry'
        expect(page).to have_content 'Sweet and Sour Chicken'
        expect(page).to have_content 'so sweet, so sour'
        expect(page).to have_content '$8.50'
      end
    end

    scenario 'an admin can add an Appetizer menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Crab Meat Rangoon'
      fill_in 'menu_item[description]', with: 'Crabby!'
      fill_in 'menu_item[price]', with: '4.25'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Appetizers', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.appetizers-container' do
        expect(page).to have_content 'Appetizers'
        expect(page).to have_content 'Crab Meat Rangoon'
        expect(page).to have_content 'Crabby!'
        expect(page).to have_content '$4.25'
      end
    end

    scenario 'an admin can add a Fried Rice menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Chicken Fried Rice'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '6.25'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Fried Rice', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.fried-rice-container' do
        expect(page).to have_content 'Fried Rice'
        expect(page).to have_content 'Chicken Fried Rice'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$6.25'
      end
    end

    scenario 'an admin can add a Pork menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Moo Shu Pork'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '8.25'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Pork', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.pork-container' do
        expect(page).to have_content 'Pork'
        expect(page).to have_content 'Moo Shu Pork'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$8.25'
      end
    end

    scenario 'an admin can add an Egg Foo Young menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Beef Egg Foo Young'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '7.75'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Egg Foo Young', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.egg-foo-young-container' do
        expect(page).to have_content 'Egg Foo Young'
        expect(page).to have_content 'Beef Egg Foo Young'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$7.75'
      end
    end

    scenario 'an admin can add a Seafood menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Hunan Shrimp'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '9.95'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Seafood', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.seafood-container' do
        expect(page).to have_content 'Seafood'
        expect(page).to have_content 'Hunan Shrimp'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$9.95'
      end
    end

    scenario 'an admin can add a Vegetable menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Sauteed Broccoli with Garlic Sauce'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '7.95'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Vegetables', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.vegetables-container' do
        expect(page).to have_content 'Vegetables'
        expect(page).to have_content 'Sauteed Broccoli with Garlic Sauce'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$7.95'
      end
    end

    scenario 'an admin can add a Lo Mein and Chow Mein menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Combination Lo Mein'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '7.95'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Lo Mein and Chow Mein', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.lo-mein-chow-mein-container' do
        expect(page).to have_content 'Lo Mein and Chow Mein'
        expect(page).to have_content 'Combination Lo Mein'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$7.95'
      end
    end

    scenario 'an admin can add a dessert menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Honey Banana'
      fill_in 'menu_item[description]', with: 'Delicious'
      fill_in 'menu_item[price]', with: '4.95'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Dessert', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.dessert-container' do
        expect(page).to have_content 'Dessert'
        expect(page).to have_content 'Honey Banana'
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '$4.95'
      end
    end

    scenario 'an admin can add a Beverages menu item' do
      visit '/menu_items/new'
      fill_in 'menu_item[name]', with: 'Soft Drink'
      fill_in 'menu_item[description]', with: 'thirst quenching'
      fill_in 'menu_item[price]', with: '1.50'
      select 'Dinner', from: 'menu_item[menu_type_id]'
      select 'Beverages', from: 'menu_item[category_id]'
      click_button 'Create Menu Item'
      visit '/menu'
      within '.beverages-container' do
        expect(page).to have_content 'Beverages'
        expect(page).to have_content 'Soft Drink'
        expect(page).to have_content 'thirst quenching'
        expect(page).to have_content '1.50'
      end
    end
  end
end