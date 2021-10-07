class User
  attr_reader :id,
              :email,
              :street_address,
              :city,
              :state,
              :zip_code

  def initialize(user_data)
    @id = user_data[:data][:id]
    @email = user_data[:data][:attributes][:email]
    @street_address = user_data[:data][:attributes][:street_address]
    @city = user_data[:data][:attributes][:city]
    @state = user_data[:data][:attributes][:state]
    @zip_code = user_data[:data][:attributes][:zip_code]
  end
end

