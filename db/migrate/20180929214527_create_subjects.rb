class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :site
      t.string :ico
      t.references :district, index: true, foreign_key: true
      t.references :subjtype, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :note
      t.string :web
      t.string :zaujimavost

      t.timestamps null: false
    end
  end
end
