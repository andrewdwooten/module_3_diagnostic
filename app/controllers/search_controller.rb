class SearchController < ApplicationController

  def index
    station = Station.new
    @stations = station.stations_in_zip(query_params[:q])
  end

private

  def query_params
    params.permit('q')
  end
end
