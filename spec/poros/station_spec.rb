require 'rails_helper'

RSpec.describe Station do
  describe "Station Object" do
    before:each do
      @incoming_hash = {
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
    end

    it "exists, has attributes, and Status is available" do
      new_station = Station.new(@incoming_hash)

      expect(new_station).to be_a Station
      expect(new_station.name).to eq("Ideal Market Capitol Hill")
      expect(new_station.distance).to eq(0.59729)
      expect(new_station.status).to eq("Available")
      expect(new_station.hours).to eq("24 hours daily")
      expect(new_station.ev_network).to eq("eVgo Network")
      expect(new_station.street_address).to eq("900 E 11th Ave")
      expect(new_station.city).to eq("Denver")
      expect(new_station.state).to eq("CO")
      expect(new_station.zip_code).to eq("80218")
    end
  end
end
