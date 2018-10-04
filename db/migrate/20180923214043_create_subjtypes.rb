class CreateSubjtypes < ActiveRecord::Migration
  def change
    create_table :subjtypes do |t|
      t.string :name
      t.string :about

      t.timestamps null: false
    end
  end
end
