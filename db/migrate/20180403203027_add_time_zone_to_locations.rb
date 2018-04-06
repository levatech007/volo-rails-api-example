class AddTimeZoneToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :timezone, :integer
  end
end
