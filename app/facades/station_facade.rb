class StationFacade
  def self.get_stations(location)
    stations = StationService.get_stations(location)
    stations[:data].map do |station|
      Station.new(station[:attributes])
    end
  end

  def self.get_station(api_id)
    station = StationService.get_station(api_id)
    StationDetails.new(station[:attributes])
  end
end