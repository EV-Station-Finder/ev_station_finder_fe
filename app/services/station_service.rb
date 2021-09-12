class StationService
  def self.get_stations(location)
    response = Faraday.get("https://ev-station-finder-backend.herokuapp.com/api/v1/stations?location=#{location}")
    # response = Faraday.get("http://localhost:3000/api/v1/stations?location=#{location}")

    body = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_station(api_id)  
  end
end
