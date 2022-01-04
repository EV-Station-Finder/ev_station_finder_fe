class StationService
  def self.get_stations(location, user_token=nil)
    response = conn.get("/api/v1/stations") do |faraday|
      faraday.params['location'] = location
      faraday.params['token'] = user_token
    end
    parse_json(response)
  end

  def self.get_station(api_id, user_token=nil)
    response = conn.get("/api/v1/stations/#{api_id}") do |faraday|
      faraday.params['token'] = user_token
    end
    parse_json(response)
  end

  def self.add_favorite_station(api_id, token)
    response = conn.post("/api/v1/favorite_stations") do |faraday|
      faraday.params['token'] = token
      faraday.params['api_id'] = api_id
    end
    parse_json(response)
  end

  def self.remove_favorite_station(api_id, token)
    response = conn.delete("/api/v1/favorite_stations") do |faraday|
      faraday.params['token'] = token
      faraday.params['api_id'] = api_id
    end
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: "https://ev-station-finder-backend.herokuapp.com")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
