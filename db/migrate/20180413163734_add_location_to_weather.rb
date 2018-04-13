class AddLocationToWeather < ActiveRecord::Migration[5.1]
  def change
    add_reference :weathers, :location, foreign_key: true
  end
end
