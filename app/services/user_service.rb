class UserService
  def self.create_user(user_params)
    response = conn.post("/api/v1/users") do |faraday|
      faraday.params['first_name'] = user_params[:first_name]
      faraday.params['last_name'] = user_params[:last_name]
      faraday.params['email'] = user_params[:email]
      faraday.params['street_address'] = user_params[:street_address]
      faraday.params['city'] = user_params[:city]      
      faraday.params['state'] = user_params[:state]
      faraday.params['zip_code'] = user_params[:zip_code]
      faraday.params['password'] = user_params[:password]
    end
    #TODO: Refactor
    # faraday.headers['ACCEPT'] = "application/json"
    # faraday.headers['Content-Type'] = "application/json"
    # faraday.params = user_params.to_json
    parse_json(response)
  end
  
  def self.log_in_user(user_params)
    response = conn.post("/api/v1/sessions") do |faraday|
      faraday.params['email'] = user_params[:email]
      faraday.params['password'] = user_params[:password]
    end
    parse_json(response)
  end

  def self.get_station(api_id)
    response = conn.get("/api/v1/stations/#{api_id}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: "https://ev-station-finder-backend.herokuapp.com")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
