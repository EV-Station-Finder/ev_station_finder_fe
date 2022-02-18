require 'rails_helper'

RSpec.describe "Dashboard Page" do
  describe "As a registered user, I log in then I am redirected to my dashboard page" do
    describe 'HAPPY PATH' do
      before :each do
        visit root_path
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_button 'Log In'
      end

      it "displays a welcome message using my email", :vcr do
        expect(page).to have_content("Welcome wizard@hogwarts.com")
      end

      it "displays a search bar to lookup nearest stations", :vcr do
        expect(page).to have_field("location")
        expect(page).to have_button("Find Stations")
        fill_in :location, with: "Las Vegas, Nevada"
        click_button "Find Stations"
        expect(current_path).to eq(stations_path)
      end

      it "displays the three nearest stations to my saved address", :vcr do
        @station1 =  {
                        "name": "G&M OIL CHEVRON #111",
                        "distance": 1.13745,
                        "status": "Available",
                        "hours": "Mon 12:00am - 12:00am; Tue 12:00am - 12:00am; Wed 12:00am - 12:00am; Thu 12:00am - 12:00am; Fri 12:00am - 12:00am; Sat 12:00am - 12:00am; Sun 12:00am - 12:00am",
                        "ev_network": "ChargePoint Network",
                        "street_address": "3600 South La Brea Ave",
                        "city": "Los Angeles",
                        "state": "CA",
                        "zip_code": "90016"
                      }
        within(".nearest-stations") do
          expect(page).to have_content("Here are the 14 stations nearest to 3722 Crenshaw Blvd. Los Angeles, CA 90016")
        end

        within("#nearest-station-0") do
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
                                "distance": nil,
                                "status": "Available",
                                "hours": "24 hours daily",
                                "ev_network": "Non-Networked",
                                "street_address": "2375 St Andrews Dr",
                                "city": "Altoona",
                                "state": "WI",
                                "zip_code": "54720"
                              }

        within(".favorite-stations") do
          expect(page).to have_content("Favorite Stations:")
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
        end
      end

      it "displays the log out link", :vcr do
        expect(page).to have_link("Log Out")
        click_link("Log Out")
        expect(current_path).to eq(root_path)
        expect(page).to_not have_link("Log Out")
        expect(page).to have_content("You have been successfully logged out")
      end

      it "redirects to dashboard when user is logged in and tries to visit the home page", :vcr do
        visit root_path
        expect(current_path).to eq(dashboard_path)
      end

      context 'nearest stations shows a favorite station' do
        it "displays 'favorited' if already saved as favorite" do
          @station1 =  {
                          "name": "G&M OIL CHEVRON #111",
                          "distance": 1.13745,
                          "status": "Available",
                          "hours": "Mon 12:00am - 12:00am; Tue 12:00am - 12:00am; Wed 12:00am - 12:00am; Thu 12:00am - 12:00am; Fri 12:00am - 12:00am; Sat 12:00am - 12:00am; Sun 12:00am - 12:00am",
                          "ev_network": "ChargePoint Network",
                          "street_address": "3600 South La Brea Ave",
                          "city": "Los Angeles",
                          "state": "CA",
                          "zip_code": "90016"
                        }
          within("#nearest-station-0") do
            expect(page).to have_content("#{@station1[:name]} - favorited")
          end
        end
      end
    end

    describe 'SAD PATH' do
      it "does not display favorite stations if a user does not have any", :vcr do
        visit root_path
        fill_in :email, with: "alliwantforxmas@example.com"
        fill_in :password, with: "ultrasecurepassword"
        click_button 'Log In'

        within(".favorite-stations") do
          expect(page).to have_content("Favorite Stations")
          expect(page).to have_content("You do not have any favorite stations yet.")
        end
      end

      it "user address does not have nearest stations", :vcr do
        visit root_path
        fill_in :email, with: "musky@example.com"
        fill_in :password, with: "password"
        click_button 'Log In'

        within(".nearest-stations") do
          expect(page).to have_content("Nearest Stations")
          expect(page).to have_content("No stations were found near 1712 Av Circunvalacion Cochabamba, Bolivia 11111")
        end
      end
    end
  end
end
