require 'rails_helper'

module Features
  module SessionHelpers
    def sign_up_with(email, password)
      user = FactoryGirl.attributes_for(:user)
      visit new_user_registration_path
      fill_in 'Enter Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Confirm Password', with: user.password
      find('input[type="submit"]').click
    end

    def sign_in_as_user
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Enter Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[type="submit"]').click
    end
  end
end
