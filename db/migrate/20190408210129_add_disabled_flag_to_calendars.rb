class AddDisabledFlagToCalendars < ActiveRecord::Migration[4.2]
  def change
  	add_column :calendars,:disabled, :boolean
  end
end
