class CreatePeople < ActiveRecord::Migration[4.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :email2
      t.string :phone
      t.string :cellphone
      t.string :note
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
