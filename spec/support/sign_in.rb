def sign_in
  visit '/admin/session/new'
  fill_in 'username', with: ENV['USERNAME']
  fill_in 'password', with: ENV['PASSWORD']
  click_button 'Sign in'
end