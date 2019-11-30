class CreateSubjtypes < ActiveRecord::Migration[4.2]
  def change
    create_table :subjtypes do |t|
      t.string :name
      t.string :about

      t.timestamps null: false
    end
  end
end
