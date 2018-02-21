class AddUserToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_reference :calendars, :user, foreign_key: true
  end
end
