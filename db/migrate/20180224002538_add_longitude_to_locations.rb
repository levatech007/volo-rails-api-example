class AddLongitudeToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :longitude, :decimal
  end
end
