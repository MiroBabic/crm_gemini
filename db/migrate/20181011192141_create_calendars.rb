class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :url
      t.references :user, index: true, foreign_key: true
      t.boolean :all_day

      t.timestamps null: false
    end
  end
end
