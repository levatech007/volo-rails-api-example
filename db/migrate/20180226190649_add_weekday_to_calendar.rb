class AddWeekdayToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :weekday, :string
  end
end
