class CreateProcurements < ActiveRecord::Migration
  def change
    create_table :procurements do |t|
      t.string :name
      t.string :subject
      t.datetime :anounced_date
      t.datetime :close_date
      t.datetime :control_date
      t.boolean :confirmed
      t.datetime :confirmed_date
      t.datetime :effective_date

      t.timestamps null: false
    end
  end
end
