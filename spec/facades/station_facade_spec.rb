require 'rails_helper'

RSpec.describe StationFacade do
  describe "::get_stations" do
    it "should return an array of station objects", :vcr do
      location = "Denver, CO"
      result = StationFacade.get_stations(location)

      expect(result).to be_an(Array)
      expect(result[0]).to be_a(Station)
      expect(result[0].instance_variables.count).to eq(11)
    end
  end
  
  describe "::get_station" do
    it "should return an array of station objects", :vcr do
      id = 152087
      result = StationFacade.get_station(id)

      expect(result).to be_a StationDetails
      expect(result.instance_variables.count).to eq(13)
    end
  end
end