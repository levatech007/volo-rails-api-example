class AddPastEventToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :past_event, :boolean, :default => false
  end
end
