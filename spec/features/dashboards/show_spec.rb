require 'rails_helper'

RSpec.describe "As a registered user" do
  describe "I log in then I am redirected to my dashboard page" do
    describe 'HAPPY PATH' do
      before :all do
        visit root_path
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_button 'Log In'
      end

      it "displays a welcome message using my email", :vcr do
        save_and_open_page
        expect(page).to have_content("Welcome wizard@hogwarts.com")
      end

      it "displays a search bar to lookup nearest stations", :vcr do
        expect(page).to have_field("location")
        expect(page).to have_button("Find Stations")
      end

      it "displays the three closest stations to my saved address", :vcr do
        @station1 =  {
                        "name": "Ideal Market Capitol Hill",
                        "distance": 0.59729,
                        "status": "Available",
                        "hours": "24 hours daily",
                        "ev_network": "eVgo Network",
                        "street_address": "900 E 11th Ave",
                        "city": "Denver",
                        "state": "CO",
                        "zip_code": "80218"
                      }

        expect(page).to have_content("Here are the 3 stations closest to 3722 Crenshaw Blvd. Los Angeles, CA 90016")

        within("#station-0") do
          expect(page).to have_content(@station1[:name])
          expect(page).to have_content(@station1[:street_address])
          expect(page).to have_content(@station1[:city])
          expect(page).to have_content(@station1[:state])
          expect(page).to have_content(@station1[:zip_code])
          expect(page).to have_content("Status: #{@station1[:status]}")
          expect(page).to have_content("Hours: #{@station1[:hours]}")
          expect(page).to have_content("Network: #{@station1[:ev_network]}")
          expect(page).to have_content("Distance from Search location: #{@station1[:distance]} miles")
        end
      end

      it "displays my favorite stations", :vcr do
        @favorite_station =  {
                                "name": "Casey's General Store",
                                "distance": 0.59729,
                                "status": "Available",
                                "hours": "24 hours daily",
                                "ev_network": "Non-Networked",
                                "street_address": "2375 St Andrews Dr",
                                "city": "Altoona",
                                "state": "WI",
                                "zip_code": "54720"
                              }

        within(".favorite-stations") do
          expect(page).to have_content("Favorite Stations")
        end

        within("#favorite-station-0") do
          expect(page).to have_content(@favorite_station[:name])
          expect(page).to have_content(@favorite_station[:street_address])
          expect(page).to have_content(@favorite_station[:city])
          expect(page).to have_content(@favorite_station[:state])
          expect(page).to have_content(@favorite_station[:zip_code])
          expect(page).to have_content("Status: #{@favorite_station[:status]}")
          expect(page).to have_content("Hours: #{@favorite_station[:hours]}")
          expect(page).to have_content("Network: #{@favorite_station[:ev_network]}")
          expect(page).to have_content("Distance from Search location: #{@favorite_station[:distance]} miles")
        end
      end

      it "does not display favorite stations if a user does not have any", :vcr do
        visit root_path
        fill_in :email, with: "alliwantforxmas@example.com"
        fill_in :password, with: "ultrasecurepassword"
        click_button 'Log In'

        within(".favorite-stations") do
          expect(page).to have_content("Favorite Stations")
          expect(page).to have_content("You have not saved any stations to your list")
        end
      end
    end

    describe 'SAD PATH' do
      it "Add sad path"

    end
  end
end
