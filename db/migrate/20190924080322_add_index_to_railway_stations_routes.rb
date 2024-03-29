# frozen_string_literal: true

class AddIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_index :railway_stations_routes, :railway_station_id
    add_index :railway_stations_routes, :route_id
  end
end
