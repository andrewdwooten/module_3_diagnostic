require 'rails_helper'

describe 'Gas Service' do
  describe '#stations_in_radius' do
    it 'returns the stations in a defined radius' do
      gas_service = GasService.new
      stations = gas_service.stations_in_radius(80205)

      byebug
    end
  end
end
