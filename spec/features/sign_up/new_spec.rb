require 'rails_helper'

RSpec.describe 'Sign Up Page' do
  describe 'When a user visits the sign up page' do
    it 'Registration page should include' do
      visit root_path
      click_link 'Sign Up'
      expect(current_path).to eq(sign_up_path) # TODO: change to path helper
      fill_in :first_name, with: "fn"
      fill_in :last_name, with: "ln"
      fill_in :email, with: "email@email.email"
      fill_in :street_address, with: "sa"
      fill_in :city, with: "c"
      fill_in :state, with: "s"
      fill_in :zip_code, with: "12345"
      fill_in :password, with: "pw"
      fill_in :password_confirmation, with: "pw"
      click_button "Sign Up"

      expect(current_path).to eq('/dashboard')
      expect(new_user.first_name).to eq('fn')
    end
  end
end
#TODO Add sad paths
#Add check to make sure password and password_confirmation work