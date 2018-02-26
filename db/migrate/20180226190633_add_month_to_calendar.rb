class AddMonthToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :month, :string
  end
end
