require 'rails_helper'

RSpec.describe 'Welcome page' do
  before do
    visit root_path
  end

  describe 'When I visit the welcome page' do
    it "I see a welcome message and a description of the application", :vcr  do
      welcome_message = "Welcome to EV Station Finder"
      description = "Search for nearby EV charging stations and get pertinent information about them such as a 10 hour forecast and driving directions from your set location. Register for an account to save your favorite stations"

      expect(page).to have_content(welcome_message)
      expect(page).to have_content(description)
    end

    it "I can see the registration button for new users", :vcr  do
      expect(page).to have_link("Sign Up")
    end

    it "I can see the login button for registered users", :vcr  do
      expect(page).to have_button("Log In")
    end

    it "I am redirected to the rooth path when I type an undefined route", :vcr do
      visit "/non-existent-route"
      expect(current_path).to eq(root_path)
    end

    describe 'When I fill in the login form' do
      it "I can see an area to enter my login information", :vcr  do
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_button "Log In"
        expect(current_path).to eq('/dashboard')
      end
    end

    describe 'When I use the quick search option' do
      it "I can see an area to do a quick search for stations", :vcr  do
        fill_in :location, with: "Las Vegas, Nevada"
        click_button "Find Stations"
        expect(current_path).to eq(stations_path)
      end
    end
  end
end
