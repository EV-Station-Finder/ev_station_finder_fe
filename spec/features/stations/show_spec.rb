require 'rails_helper'

RSpec.describe "As a guest user" do
  describe "I visit the stations show page" do
    it "displays a single station attributes" do
      @station1 =  {
            "name": "Casey's General Store",
            "api_id": 152087,
            "status": "Available",
            "hours": "24 hours daily",
            "ev_network": nil,
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
                    "time": "21:07",
                    "temperature": 69.44,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "21:00",
                    "temperature": 69.44,
                    "conditions": "clear sky",
                    "icon": "01d"
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
        }

      visit "/stations/#{@station1[:api_id]}"

      # expect(page).to have_content("Nearest Stations")
      # within("#station-0") do
      #   expect(page).to have_content(@station1[:name])
      #   expect(page).to have_content(@station1[:address])
      #   expect(page).to have_content(@station1[:city])
      #   expect(page).to have_content(@station1[:state])
      #   expect(page).to have_content(@station1[:zip_code])
      #   expect(page).to have_content("Status: #{@station1[:status]}")
      #   expect(page).to have_content("Hours: #{@station1[:hours]}")
      #   expect(page).to have_content("Network: #{@station1[:ev_network]}")
      #   expect(page).to have_content("Distance from Search location: #{@station1[:distance]} miles")
      # end
    end
  end
end
