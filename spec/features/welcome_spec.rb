require 'rails_helper'

feature 'visiting the homepage' do
  scenario 'a user sees basic information on the homepage' do
    visit '/'
    expect(page).to have_content 'Hunan Springs'
    expect(page).to have_content 'Menu'
    expect(page).to have_content 'About Us'
    expect(page).to have_content 'Contact Us'
  end

  scenario 'a user can visit the menu page' do
    create_categories
    create_menu_types
    create_menu_item
    visit '/'
    click_link 'Menu'
    expect(page).to have_content 'Sesame Chicken'
  end
end