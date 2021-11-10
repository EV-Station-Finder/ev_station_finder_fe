require 'rails_helper'

RSpec.describe 'Log In Page' do
  
  describe 'When a user visits the log in section of the welcome page' do
    describe 'HAPPY PATH' do
      it 'Log in section should successfully redirect to their dashboard', :vcr do
        visit root_path 
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_button 'Log In'
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Welcome wizard@hogwarts.com') 
      end
      
      xit 'And they log in, they can successfully log out', :vcr  do
        visit root_path 
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_link 'Log In'
        expect(current_path).to eq(dashboard_path)
        click_link 'Log out'
        expect(current_path).to eq(root_path)
        expect(page).to_not have_link('Log Out')
      end
    end
  
    describe 'SAD PATH' do
      xit "and the user enters the wrong password", :vcr  do
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "wrong_pw"
        click_link 'Log In'
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Placeholder error message")
      end
      
      xit "and the user enters the wrong email", :vcr  do
        fill_in :email, with: "wrongemail@example.com"
        fill_in :password, with: "verysecurepassword"
        click_link 'Log In'
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Placeholder error message")
      end
      
      xit "and the user is not a registered user", :vcr  do
        fill_in :email, with: "notregistered@example.com"
        fill_in :password, with: "notregistered"
        click_link 'Log In'
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Placeholder error message")
      end
      
      xit "and the user submits blank fields", :vcr  do
        fill_in :email, with: ""
        fill_in :password, with: ""
        click_link 'Log In'
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Placeholder error message")
      end
    end
  end
end
