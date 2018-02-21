class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.text :location
      t.datetime :date
      t.text :notes
      t.text :weather

      t.timestamps
    end
  end
end
