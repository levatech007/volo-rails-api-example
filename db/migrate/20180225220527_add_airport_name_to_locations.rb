class AddAirportNameToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :airport_name, :string
  end
end
