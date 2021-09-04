require 'rails_helper'

RSpec.describe StationService do
  describe "::get_stations" do
    it "fetches stations based on location", :vcr do
      result = StationService.get_stations("Denver, CO")
      expect(result).to be_a Hash
      expect(result[:data]).to be_a Array
      expect(result[:data][0]).to be_a Hash
      expect(result[:data][0]).to have_key(:id)
      expect(result[:data][0]).to have_key(:type)
      expect(result[:data][0]).to have_key(:attributes)
      expect(result[:data][0][:attributes][:name]).to be_a String
      expect(result[:data][0][:attributes][:distance]).to be_a Float
      expect(result[:data][0][:attributes][:status]).to be_a String
      expect(result[:data][0][:attributes][:hours]).to be_a String
      expect(result[:data][0][:attributes][:ev_network]).to be_a String
      expect(result[:data][0][:attributes][:street_address]).to be_a String
      expect(result[:data][0][:attributes][:city]).to be_a String
      expect(result[:data][0][:attributes][:state]).to be_a String
      expect(result[:data][0][:attributes][:zip_code]).to be_a String
    end
  end
end
