require 'rails_helper'

describe 'station poro' do
  describe '#stations_in_zip' do
    it 'returns formatted station data' do
      VCR.use_cassette('models/stations/stations_in_zip') do
        station = Station.new
        stations = station.stations_in_zip('80205')
        closest = stations.first

        expect(stations.class).to eq(Array)
        expect(closest.class).to eq(Station)
        expect(closest).to respond_to(:city)
        expect(closest).to respond_to(:address)
        expect(closest).to respond_to(:fuel_type)
        expect(closest).to respond_to(:name)
        expect(closest).to respond_to(:distance)
        expect(closest).to respond_to(:access_time)
        expect(closest.distance < stations.last.distance).to eq(true)
      end
    end
  end
end
