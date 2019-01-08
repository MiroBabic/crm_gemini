class CreateOprograms < ActiveRecord::Migration
  def change
    create_table :oprograms do |t|
      t.string :name
      t.string :note

      t.timestamps null: false
    end
  end
end
