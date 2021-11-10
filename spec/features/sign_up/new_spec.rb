require 'rails_helper'

RSpec.describe 'Sign Up Page' do
  describe 'HAPPY PATH' do
    describe 'When a user visits the sign up page' do
      it 'Registration page should include', :vcr do
        visit root_path
        click_link 'Sign Up'
        expect(current_path).to eq(sign_up_path)
        fill_in :first_name, with: "fn"
        fill_in :last_name, with: "ln"
        fill_in :email, with: "elonmusk@example.com"
        fill_in :street_address, with: "sa"
        fill_in :city, with: "c"
        fill_in :state, with: "s"
        fill_in :zip_code, with: "12345"
        fill_in :password, with: "pw"
        fill_in :password_confirmation, with: "pw"
        click_button "Sign Up"
        expect(current_path).to eq(dashboard_path)
      end
    end
  end

  describe 'SAD PATHS' do
    describe 'When a user visits the sign up page' do
      it "and the user provides an email that's already taken registration page should include", :vcr do
        visit root_path
        click_link 'Sign Up'
        expect(current_path).to eq(sign_up_path)
        fill_in :first_name, with: "fn"
        fill_in :last_name, with: "ln"
        fill_in :email, with: "email5@email.email"
        fill_in :street_address, with: "sa"
        fill_in :city, with: "c"
        fill_in :state, with: "s"
        fill_in :zip_code, with: "12345"
        fill_in :password, with: "pw"
        fill_in :password_confirmation, with: "pw"
        click_button "Sign Up"
        expect(current_path).to eq(sign_up_path)
        expect(page).to have_content("Validation failed: Email has already been taken")
      end

      it "and the user does not provide an email", :vcr do
        visit root_path
        click_link 'Sign Up'
        expect(current_path).to eq(sign_up_path)
        fill_in :first_name, with: "fn"
        fill_in :last_name, with: "ln"
        fill_in :email, with: ""
        fill_in :street_address, with: "sa"
        fill_in :city, with: "c"
        fill_in :state, with: "s"
        fill_in :zip_code, with: "12345"
        fill_in :password, with: "pw"
        fill_in :password_confirmation, with: "pw"
        click_button "Sign Up"
        expect(find_field(:email)[:required]).to eq("required")
        expect(current_path).to eq(sign_up_path)
      end

      it "and the user provides an invalid email", :vcr do
        visit root_path
        click_link 'Sign Up'
        expect(current_path).to eq(sign_up_path)
        fill_in :first_name, with: "fn"
        fill_in :last_name, with: "ln"
        fill_in :email, with: "@htgeorg"
        fill_in :street_address, with: "sa"
        fill_in :city, with: "c"
        fill_in :state, with: "s"
        fill_in :zip_code, with: "12345"
        fill_in :password, with: "pw"
        fill_in :password_confirmation, with: "pw"
        click_button "Sign Up"
        expect(current_path).to eq(sign_up_path)
        expect(page).to have_content("Validation failed: Email is invalid")
      end
    end
    # TODO
    # Test authorization
    # Add check to make sure password and password_confirmation work
  end
end
