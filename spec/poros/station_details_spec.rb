require 'rails_helper'

RSpec.describe StationDetails do
  describe "Station Details Object" do
    before:each do
      @incoming_hash = {
                         :name=>"Casey's General Store",
                         :api_id=>152087,
                         :status=>"Available",
                         :hours=>"24 hours daily",
                         :ev_network=>"Tesla Super Charger",
                         :ev_connector_types=>["CHADEMO", "J1772COMBO"],
                         :street_address=>"2375 St Andrews Dr",
                         :city=>"Altoona",
                         :state=>"WI",
                         :zip_code=>"54720",
                         :is_favorited=>nil,
                         :accepted_payments=>["American Express", "Discover", "MasterCard", "Visa"],
                         :hourly_weather=>
                          [{:time=>"23:12", :temperature=>65.23, :conditions=>"scattered clouds", :icon=>"03d"},
                           {:time=>"23:00", :temperature=>65.23, :conditions=>"scattered clouds", :icon=>"03d"},
                           {:time=>"00:00", :temperature=>64.53, :conditions=>"scattered clouds", :icon=>"03d"},
                           {:time=>"01:00", :temperature=>63.5, :conditions=>"broken clouds", :icon=>"04n"},
                           {:time=>"02:00", :temperature=>62.19, :conditions=>"broken clouds", :icon=>"04n"},
                           {:time=>"03:00", :temperature=>60.22, :conditions=>"overcast clouds", :icon=>"04n"},
                           {:time=>"04:00", :temperature=>57.97, :conditions=>"overcast clouds", :icon=>"04n"},
                           {:time=>"05:00", :temperature=>57.31, :conditions=>"overcast clouds", :icon=>"04n"},
                           {:time=>"06:00", :temperature=>56.5, :conditions=>"overcast clouds", :icon=>"04n"},
                           {:time=>"07:00", :temperature=>51.37, :conditions=>"few clouds", :icon=>"02n"}]
                         }
    end

    it "exists, has attributes, and Status is available" do
      new_station = StationDetails.new(@incoming_hash)

      expect(new_station).to be_a StationDetails
      expect(new_station.name).to eq("Casey's General Store")
      expect(new_station.api_id).to eq(152087)
      expect(new_station.status).to eq("Available")
      expect(new_station.hours).to eq("24 hours daily")
      expect(new_station.ev_connector_types).to eq(["CHADEMO", "J1772COMBO"])
      expect(new_station.ev_network).to eq("Tesla Super Charger")
      expect(new_station.street_address).to eq("2375 St Andrews Dr")
      expect(new_station.city).to eq("Altoona")
      expect(new_station.state).to eq("WI")
      expect(new_station.zip_code).to eq("54720")
      expect(new_station.is_favorited).to eq(nil)
      expect(new_station.accepted_payments).to eq(["American Express", "Discover", "MasterCard", "Visa"])
      hourly_weather = [{:time=>"23:12", :temperature=>65.23, :conditions=>"scattered clouds", :icon=>"03d"},
                       {:time=>"23:00", :temperature=>65.23, :conditions=>"scattered clouds", :icon=>"03d"},
                       {:time=>"00:00", :temperature=>64.53, :conditions=>"scattered clouds", :icon=>"03d"},
                       {:time=>"01:00", :temperature=>63.5, :conditions=>"broken clouds", :icon=>"04n"},
                       {:time=>"02:00", :temperature=>62.19, :conditions=>"broken clouds", :icon=>"04n"},
                       {:time=>"03:00", :temperature=>60.22, :conditions=>"overcast clouds", :icon=>"04n"},
                       {:time=>"04:00", :temperature=>57.97, :conditions=>"overcast clouds", :icon=>"04n"},
                       {:time=>"05:00", :temperature=>57.31, :conditions=>"overcast clouds", :icon=>"04n"},
                       {:time=>"06:00", :temperature=>56.5, :conditions=>"overcast clouds", :icon=>"04n"},
                       {:time=>"07:00", :temperature=>51.37, :conditions=>"few clouds", :icon=>"02n"}
                      ]
      expect(new_station.hourly_weather).to eq(hourly_weather)
    end
  end
end
