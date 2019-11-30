class CreateUserprofiles < ActiveRecord::Migration[4.2]
  def change
    create_table :userprofiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :smtp1
      t.integer :port1
      t.string :email_acc1
      t.string :email_pass1
      t.string :smtp2
      t.integer :port2
      t.string :email_acc2
      t.string :email_pass2
      t.string :smtp3
      t.integer :port3
      t.string :email_acc3
      t.string :email_pass3

      t.timestamps null: false
    end
  end
end
