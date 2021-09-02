require 'rails_helper'

RSpec.describe "As a guest user" do
  describe "I visit the stations index page" do
    it "displays each station with corresponding attributes" do
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
      
      visit "/stations?location=denver,co"
                      
      expect(page).to have_content("Nearest Stations")
      within("#station-#{@station1.id}") do
        expect(page).to have_content(@station1[:name])
        expect(page).to have_content(@station1[:address])
        expect(page).to have_content(@station1[:city])
        expect(page).to have_content(@station1[:state])
        expect(page).to have_content(@station1[:zip_code])
        expect(page).to have_content(@station1[:status])
        expect(page).to have_content(@station1[:hours])
        expect(page).to have_content(@station1[:ev_network])
        expect(page).to have_content(@station1[:distance])
      end
    end
  end
end