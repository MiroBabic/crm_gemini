class CreateProjecttargets < ActiveRecord::Migration
  def change
    create_table :projecttargets do |t|
      t.string :name
      t.text :about

      t.timestamps null: false
    end
  end
end
