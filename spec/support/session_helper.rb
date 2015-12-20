def sign_up
    visit new_user_registration_path
    fill_in :user_email, :with => 'user@example.com'
    fill_in :user_username, :with => 'Alex'
    fill_in :user_password, :with => '123456789'
    fill_in :user_password_confirmation, :with => '123456789'

    click_button 'Sign up'
end