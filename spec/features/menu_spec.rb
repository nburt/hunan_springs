require 'rails_helper'

feature "menu display" do

  before do
    create_categories
    create_menu_types
    create_sizes
  end

  scenario 'it displays the lunch menu between 8 am - 3 pm' do
    dinner_item = MenuItem.create!(
      name: 'Mongolian Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.first.id
    )
    lunch_item = MenuItem.create!(
      name: 'Hunan Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.last.id
    )

    travel_to(Time.parse("08:00:01 -0600")) do
      visit '/menu'
      expect(page).to_not have_content(dinner_item.name)
      expect(page).to have_content(lunch_item.name)
    end

    travel_to(Time.parse("14:59:59 -0600")) do
      visit '/menu'
      expect(page).to_not have_content(dinner_item.name)
      expect(page).to have_content(lunch_item.name)
    end
  end

  scenario 'it displays the dinner menu between 3 pm - 8 am' do
    dinner_item = MenuItem.create!(
      name: 'Mongolian Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.first.id
    )
    lunch_item = MenuItem.create!(
      name: 'Hunan Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.last.id
    )

    travel_to(Time.parse("07:59:59 -0600")) do
      visit '/menu'
      expect(page).to have_content(dinner_item.name)
      expect(page).to_not have_content(lunch_item.name)
    end

    travel_to(Time.parse("15:00:01 -0600")) do
      visit '/menu'
      expect(page).to have_content(dinner_item.name)
      expect(page).to_not have_content(lunch_item.name)
    end
  end

  scenario 'a user can click on lunch menu to switch, even if it is dinner time' do
    dinner_item = MenuItem.create!(
      name: 'Mongolian Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.first.id
    )
    lunch_item = MenuItem.create!(
      name: 'Hunan Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.last.id
    )

    travel_to(Time.parse("07:59:59 -0600")) do
      visit '/menu'
      expect(page).to have_content(dinner_item.name)
      expect(page).to_not have_content(lunch_item.name)

      click_link 'Lunch Menu'
      expect(page).to_not have_content(dinner_item.name)
      expect(page).to have_content(lunch_item.name)
    end
  end

  scenario 'a user can click on dinner menu to switch, even if it is lunch time' do
    dinner_item = MenuItem.create!(
      name: 'Mongolian Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.first.id
    )
    lunch_item = MenuItem.create!(
      name: 'Hunan Beef', description: 'delicious', price: '8.50',
      category_id: Category.first.id, menu_type_id: MenuType.last.id
    )

    travel_to(Time.parse("08:00:01 -0600")) do
      visit '/menu'
      expect(page).to_not have_content(dinner_item.name)
      expect(page).to have_content(lunch_item.name)

      click_link 'Dinner Menu'
      expect(page).to have_content(dinner_item.name)
      expect(page).to_not have_content(lunch_item.name)
    end
  end

end