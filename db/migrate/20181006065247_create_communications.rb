class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.text :about
      t.string :keyword
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
