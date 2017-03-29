class GasService

  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1')
    @auth = "api_key=#{ENV['GAS_KEY']}"
  end

  def stations_in_radius(radius)

  end


  private

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end
end
