class CreateDistricts < ActiveRecord::Migration[4.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :county
      t.string :country
      t.string :note

      t.timestamps null: false
    end
  end
end
