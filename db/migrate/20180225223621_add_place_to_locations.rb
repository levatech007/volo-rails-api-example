class AddPlaceToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :place, :string
  end
end
