class StationsFacade
  def self.get_stations(location)
    stations = StationService.get_stations(location)
    stations[:data].map do |station|
      Station.new(station[:attributes])
    end
  end
end