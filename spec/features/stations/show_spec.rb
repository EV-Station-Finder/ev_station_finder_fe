require 'rails_helper'

RSpec.describe "Station Show" do
  describe "HAPPY PATH" do
    let(:station1) { {
      "name": "Casey's General Store",
      "api_id": 152087,
      "status": "Available",
      "hours": "24 hours daily",
      "ev_network": nil,
      "ev_connector_types": ["CHADEMO", "J1772COMBO"],
      "street_address": "2375 St Andrews Dr",
      "city": "Altoona",
      "state": "WI",
      "zip_code": "54720",
      "accepted_payments": [
        "American Express",
        "Discover",
        "MasterCard",
        "Visa"
      ],
      "hourly_weather": [
        {
          "time": "20:49",
          "temperature": 30,
          "conditions": "light snow",
          "icon": "04d"
        },
        {
          "time": "21:00",
          "temperature": 75,
          "conditions": "broken clouds",
          "icon": "n15"
        },
        {
          "time": "22:00",
          "temperature": 70.11,
          "conditions": "few clouds",
          "icon": "02d"
        },
        {
          "time": "23:00",
          "temperature": 70.14,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "00:00",
          "temperature": 66.29,
          "conditions": "broken clouds",
          "icon": "04d"
        },
        {
          "time": "01:00",
          "temperature": 61.45,
          "conditions": "clear sky",
          "icon": "01n"
        },
        {
          "time": "02:00",
          "temperature": 57.52,
          "conditions": "clear sky",
          "icon": "01n"
        },
        {
          "time": "03:00",
          "temperature": 55.56,
          "conditions": "clear sky",
          "icon": "01n"
        },
        {
          "time": "04:00",
          "temperature": 54.3,
          "conditions": "clear sky",
          "icon": "01n"
        },
        {
          "time": "05:00",
          "temperature": 53.65,
          "conditions": "clear sky",
          "icon": "01n"
        }
      ]
    } }

    let(:station2) { {
      "name": "G&M OIL CHEVRON #111",
      "api_id": 182990
      } }

    describe "As a guest user, I visit the stations show page" do
      it "displays a single station attributes", :vcr do
        visit station_path(station1[:api_id])

        expect(page).to have_content(station1[:name])
        expect(page).to have_content("Address: #{station1[:street_address]}, #{station1[:city]}, #{station1[:state]} #{station1[:zip_code]}")
        expect(page).to have_content("Status: #{station1[:status]}")
        expect(page).to have_content("Hours: #{station1[:hours]}")
        # expect(page).to have_content("EV Network: #{station1[:ev_network]}")
        expect(page).to have_content("10 Hour Forecast")
        within("#forecast-0") do
          expect(page).to have_content(station1[:hourly_weather][0][:time])
          expect(page).to have_content(station1[:hourly_weather][0][:temperature].to_i)
          expect(page).to have_content(station1[:hourly_weather][0][:conditions])
          # expect(page).to have_xpath("https://openweathermap.org/img/wn/#{station1[:hourly_weather][0][:icon]}@2x.png")
          expect(page).to have_css("img[src*='https://openweathermap.org/img/wn/#{station1[:hourly_weather][0][:icon]}@2x.png']")
        end
        within("#accepted_payment-0") do
          expect(page).to have_content("American Express")
        end
      end

      it "does not display the logout link", :vcr do
        visit station_path(station1[:api_id])
        expect(page).to_not have_link("Log Out")
        expect(page).to have_link("Log In")
      end

      it "does not display favorite station link"
      # TODO: decide if this will lead to registration page, if we want it to display an alternative link, or not display anything

      it "redirects guest to welcome page if favorite station link is clicked", :vcr do
        visit station_path(station1[:api_id])
        expect(current_path).to eq(station_path(station1[:api_id]))
        click_link("Favorite Station")
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Please Log In")
      end

      it 'displays a message if station has no connector types listed', :vcr do
        station1[:ev_connector_types] = nil
        visit station_path(station1[:api_id])

        expect(page).to have_content("Connector types are unknown for this station")
      end
    end

    describe "As a logged in user, I visit the stations show page" do
      before :each do
        visit root_path
        fill_in :email, with: "wizard@hogwarts.com"
        fill_in :password, with: "verysecurepassword"
        click_button 'Log In'
        click_link "G&M OIL CHEVRON #111"
      end

      it "display link to favorite a station", :vcr do
        expect(current_path).to eq(station_path(station2[:api_id]))
        click_link("Favorite Station")
        expect(current_path).to eq(station_path(station2[:api_id]))
        expect(page).to have_content("#{station2[:name]} has been added to your favorite stations")

        visit dashboard_path

        within("#favorite-station-3") do
          expect(page).to have_content(station2[:name])
        end
        # TODO: Remove station 2 from favorites once point has been created
        # click_link("Unfavorite Station")
      end

      xit "displays link to unfavorite a station", :vcr do
        # click_link("Unfavorite Station")
        # expect(current_path).to eq(station_path(station1[:api_id]))
        # expect(page).to have_content("#{station1[:name]} has been added to your favorite stations")
        # click_link("Favorite Station")
      end


      it "displays the logout link", :vcr do
        expect(page).to have_link("Log Out")
        expect(page).to_not have_link("Log In")
      end
    end
  end

  describe "SAD PATH" do
    describe "As a logged in user, I visit the stations show page" do
      it "displays a message if same user attempts to favorite an already favorited station"

    end
  end
end
