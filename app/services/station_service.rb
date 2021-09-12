class StationService
  def self.get_stations(location)
    response = conn.get("/api/v1/stations") do |faraday|
      faraday.params['location'] = location
    end
    # response = Faraday.get("http://localhost:3000/api/v1/stations?location=#{location}")
    parse_json(response)
  end

  def self.get_station(api_id)
  end

  def self.conn
    Faraday.new(url: "https://ev-station-finder-backend.herokuapp.com")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
