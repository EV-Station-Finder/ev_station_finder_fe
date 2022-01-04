class StationFacade
  def self.get_stations(location, user_token=nil)
    stations = StationService.get_stations(location, user_token)
    if stations[:errors]
      stations
    else
      stations[:data].map do |station|
        Station.new(station[:attributes])
      end
    end
  end

  def self.get_station(api_id, user_token=nil)
    station = StationService.get_station(api_id, user_token)
    StationDetails.new(station[:data][:attributes])
  end
  
  def self.add_favorite_station(api_id, token)
    StationService.add_favorite_station(api_id, token)
  end
  
  def self.remove_favorite_station(api_id, token)
    StationService.remove_favorite_station(api_id, token)
  end
end
