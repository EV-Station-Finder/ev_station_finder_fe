require 'rails_helper'

RSpec.describe ApplicationController do
  describe 'Authorize' do
    describe 'Only an authorized user can visit any page' do
      before :each do
        visit root_path
      end
      describe 'HAPPY PATH' do
        it 'A user that has an authorized token can access the dashboard', :vcr do
          fill_in :email, with: "wizard@hogwarts.com"
          fill_in :password, with: "verysecurepassword"
          click_button 'Log In'
          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content('Welcome wizard@hogwarts.com')
        end
      end

      describe 'SAD PATH' do
        it "Unauthorized users with no token are sent back to root path", :vcr  do
          visit dashboard_path
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Please Log In")
        end
      end
    end
  end
end
