require 'rails_helper'

describe 'Gas Service' do
  describe '#stations_in_radius' do
    it 'returns the stations in a defined radius' do
      VCR.use_cassette('services/gas_service/radius') do
      gas_service = GasService.new
      stations = gas_service.stations_in_radius('80205')
      closest = stations.first

      expect(closest[:station_phone]).to eq("888-758-4389")
      expect(closest[:station_name]).to eq("ROCKIES PARKING")
      expect(closest[:fuel_type_code]).to eq("ELEC")
    end
    end
  end
end
