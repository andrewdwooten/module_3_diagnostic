class GasService
  attr_reader :connection, :auth
  
  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1')
    @auth = "api_key=#{ENV['GAS_KEY']}"
  end

  def stations_in_radius(zip_code)
    response = connection.get "/nearest.json?location=#{zip_code}&radius=6&fuel_type=ELEC,LPG&limit=10&#{auth}"
byebug
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
