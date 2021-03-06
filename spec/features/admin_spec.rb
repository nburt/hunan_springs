require 'rails_helper'

feature "admin dashboard" do
  context "CRUDing menu items" do

    before do
      sign_in
      create_categories
      create_menu_types
    end

    context "adding menu items" do

      scenario 'an admin can add a Chef Special menu item' do
        visit '/admin/menu_items'
        click_link 'Add Menu Item'
        expect(page).to have_content 'Add Menu Item'
        fill_in 'menu_item[name]', with: 'Sesame Chicken'
        fill_in 'menu_item[description]', with: 'Chicken, sesame, spicy'
        fill_in 'menu_item[price]', with: '9.95'
        select 'Dinner', from: 'menu_item[menu_type_id]'
        select 'Chef Special', from: 'menu_item[category_id]'
        click_button 'Create Menu Item'
        expect(page).to have_content 'Sesame Chicken was successfully added!'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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
        visit '/admin/menu_items/new'
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

      scenario 'an admin can add a Soup menu item' do
        visit '/admin/menu_items/new'
        fill_in 'menu_item[name]', with: 'Wonton Soup'
        fill_in 'menu_item[description]', with: 'Delicious'
        fill_in 'menu_item[price]', with: '1.25'
        select 'Dinner', from: 'menu_item[menu_type_id]'
        select 'Soup', from: 'menu_item[category_id]'
        click_button 'Create Menu Item'
        visit '/menu'
        within '.soup-container' do
          expect(page).to have_content 'Soup'
          expect(page).to have_content 'Wonton Soup'
          expect(page).to have_content 'Delicious'
          expect(page).to have_content '1.25'
        end
      end

      scenario 'admin is directed to menu item index after successful menu item creation' do
        visit '/admin/menu_items'
        click_link 'Add Menu Item'
        fill_in 'menu_item[name]', with: 'Wonton Soup'
        fill_in 'menu_item[description]', with: 'Delicious'
        fill_in 'menu_item[price]', with: '1.25'
        select 'Dinner', from: 'menu_item[menu_type_id]'
        select 'Soup', from: 'menu_item[category_id]'
        click_button 'Create Menu Item'
        expect(page).to have_content 'Wonton Soup was successfully added!'

        expect(page).to have_content 'Name'
        expect(page).to have_content 'Description'
        expect(page).to have_content 'Price'
        expect(page).to have_content 'Menu Type'
        expect(page).to have_content 'Category'

        within 'table' do
          expect(page).to have_content 'Wonton Soup'
        end
        expect(page).to have_content 'Delicious'
        expect(page).to have_content '1.25'
        expect(page).to have_content 'Dinner'
        within 'table td:nth-child(5)' do
          expect(page).to have_content 'Soup'
        end
        expect(page).to have_content 'Small'

        click_link 'Add Menu Item'
        expect(page).to have_field 'menu_item[name]'
      end

    end

    context "update, read, destroy menu items" do

      scenario 'an admin can view menu items' do
        sign_in
        create_menu_item
        create_menu_item('General Tso Chicken')

        expect(page).to have_content 'Sesame Chicken'
        expect(page).to have_content 'General Tso Chicken'
      end

      scenario 'an admin can update menu items' do
        sign_in
        create_menu_item
        click_link('Edit')
        fill_in('menu_item[name]', with: 'Mongolian Beef')
        fill_in('menu_item[description]', with: 'Beefy')
        fill_in('menu_item[price]', with: '8.50')
        select('Dinner', from: 'menu_item[menu_type_id]')
        select('Beef', from: 'menu_item[category_id]')
        click_button('Update Menu Item')
        expect(page).to_not have_content('Sesame Chicken')
        expect(page).to_not have_content('Chicken, sesame, spicy')
        expect(page).to_not have_content('$9.95')
        expect(page).to_not have_content('Chef Special')
        expect(page).to have_content('Mongolian Beef')
        expect(page).to have_content('Beefy')
        expect(page).to have_content('$8.50')
      end

      scenario 'an admin can delete menu items' do
        create_menu_item
        click_link('Delete')
        expect(page).to_not have_content('Sesame Chicken')
      end
    end
  end

  context "CRUDing categories" do
    scenario 'an admin can create a category' do
      sign_in
      visit('/admin/categories/new')
      fill_in('category[name]', with: 'Chef Specials')
      click_button('Create Category')
      expect(page).to have_content('Categories')
      expect(page).to have_content('Chef Specials was successfully created!')
      within('table') do
        expect(page).to have_content('Chef Specials')
      end
      click_link('Add Category')
      expect(page).to have_field('category[name]')
    end

    scenario 'an admin can edit a category' do
      Category.create!(name: 'Chef Special')
      sign_in
      visit(admin_categories_path)
      click_link('Edit')
      fill_in('category[name]', with: 'Beef')
      click_button('Update Category')
      expect(page).to_not have_content('Chef Special')
      expect(page).to have_content('Beef')
    end

    scenario 'an admin can delete a category' do
      Category.create!(name: 'Chef Special')
      sign_in
      visit(admin_categories_path)
      click_link('Delete')
      expect(page).to_not have_content('Chef Special')
    end
  end

  context "CRUDing menu types" do
    scenario 'an admin can create a menu type' do
      sign_in
      visit('/admin/menu_types/new')
      fill_in('menu_type[name]', with: 'Lunch')
      click_button('Create Menu Type')
      expect(page).to have_content('Menu Types')
      expect(page).to have_content('Menu Type: Lunch was successfully created!')
      within('table') do
        expect(page).to have_content('Lunch')
      end
      click_link('Add Menu Type')
      expect(page).to have_field('menu_type[name]')
    end

    scenario 'an admin can edit a menu type' do
      MenuType.create!(name: 'Lunch')
      sign_in
      visit(admin_menu_types_path)
      click_link('Edit')
      fill_in('menu_type[name]', with: 'Dinner')
      click_button('Update Menu Type')
      expect(page).to_not have_content('Lunch')
      expect(page).to have_content('Dinner')
    end

    scenario 'an admin can delete a menu type' do
      MenuType.create!(name: 'Lunch')
      sign_in
      visit(admin_menu_types_path)
      click_link('Delete')
      expect(page).to_not have_content('Lunch')
    end
  end

  context "login" do
    scenario 'users are redirected to sign in page where they can sign in,' do
      visit '/admin'
      expect(page).to have_content('Please sign in')

      fill_in 'username', with: ENV['USERNAME']
      fill_in 'password', with: ENV['PASSWORD']
      click_button 'Sign in'

      expect(page).to have_content 'Welcome, admin!'
    end

    scenario 'admin can log out' do
      sign_in
      click_link 'Logout'
      expect(page).to have_content('Please sign in')
    end
  end

  context "admin navigation" do
    scenario 'admin can access admin dashboard through secondary navigation bar' do
      sign_in
      within '.admin-nav' do
        expect(page).to have_link('Dashboard')
        expect(page).to have_link('Menu Items')
        expect(page).to have_link('Categories')
        expect(page).to have_link('Menu Types')
        expect(page).to have_link('Logout')
      end
    end
  end
end