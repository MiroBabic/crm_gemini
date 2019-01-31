class CreateImplnotes < ActiveRecord::Migration
  def change
    create_table :implnotes do |t|
      t.references :implementation, index: true, foreign_key: true
      t.text :note
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
