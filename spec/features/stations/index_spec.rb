require 'rails_helper'

RSpec.describe "Station Index" do
  describe "As as guest user, I visit the stations index page" do
    it "displays each station with corresponding attributes", :vcr do
      @station1 =  {
                      "api_id": 198643,
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

      visit "/stations?location=denver,co"

      expect(page).to have_content("Nearest Stations")

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

    it "does not display the logout link", :vcr do
      visit "/stations?location=denver,co"
      expect(page).to_not have_link("Log Out")
    end
  end
end
