require 'rails_helper'

feature 'visiting the homepage' do
  scenario 'a user can visit the menu page' do
    create_categories
    category = Category.first
    create_menu_types
    menu_type = MenuType.first
    MenuItem.create!({
                       name: 'Sesame Chicken',
                       description: 'Chicken, sesame, spicy',
                       price: '9.95',
                       menu_type_id: menu_type.id,
                       category_id: category.id
                     })
    visit '/'
    click_link 'Menu'
    expect(page).to have_content 'Sesame Chicken'
  end

  scenario 'a user can visit the contact us page' do
    visit '/'
    click_link 'Contact Us'
    expect(page).to have_content '24 E. Kiowa St.'
  end
end