class Station < OpenStruct

  def stations_in_zip(zip_code)
    stations = GasService.new.stations_in_radius(zip_code)
    format_stations(stations)
  end

  def format_stations(stations)
    stations = stations.map do |station|
      Station.new(city:         station[:city],
                  address:      station[:street_address],
                  fuel_type:    station[:fuel_type_code],
                  name:         station[:station_name],
                  distance:     station[:distance],
                  access_time:  station[:access_days_time])
    end
    stations.sort_by! {|station| station.distance}
  end
end
