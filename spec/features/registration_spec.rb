feature 'Registration' do
  scenario 'Visitor registers successfully via register form' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in :email, with: 'biogroup@interia.pl'
      fill_in :password, with: 'Odessey123'
      click_button('Sign up')
    end
    expect(page).to have_content 'Bookstore'
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
  end
end
