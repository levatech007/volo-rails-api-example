class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.date :date
      t.integer :day
      t.string :month
      t.string :day_of_week
      t.string :wind_dir
      t.integer :wind_speed
      t.integer :high_temp
      t.integer :low_temp
      t.string :conditions_icon
      t.string :conditions_txt

      t.timestamps
    end
  end
end
