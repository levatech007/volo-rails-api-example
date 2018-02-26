class AddIconToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :icon_url, :string
  end
end
