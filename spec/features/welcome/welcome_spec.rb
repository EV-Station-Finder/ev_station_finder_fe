require 'rails_helper'

RSpec.describe 'Welcome page' do
  before do
    visit root_path
  end
  
  describe 'When I visit the welcome page' do
    it "I see a welcome message and a description of the application" do
      welcome_message = "Welcome to EV Station Finder"
      description = "Search for nearby EV charging stations and get pertinent information about them such as a 10 hour forecast and driving directions from your set location. Register for an account to save your favorite stations"
                     
      expect(page).to have_content(welcome_message)
      expect(page).to have_content(description)
    end
    
    it "I can see the registration button for new users" do
      expect(page).to have_button("Sign Up")
    end
    
    it "I can see the login button for registered users" do
      expect(page).to have_button("Log In")
    end
  end 
end
