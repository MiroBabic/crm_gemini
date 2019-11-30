class CreateOprograms < ActiveRecord::Migration[4.2]
  def change
    create_table :oprograms do |t|
      t.string :name
      t.string :note

      t.timestamps null: false
    end
  end
end
