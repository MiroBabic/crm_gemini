class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :person, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.string :name
      t.string :contract
      t.string :order
      t.string :control_zonfp
      t.string :note
      t.string :contractor
      t.boolean :sent_to_sign
      t.boolean :submit_online
      t.boolean :submit_print
      t.references :user, index: true, foreign_key: true
      t.float :agreed_payment
      t.float :payment
      t.datetime :due_date
      t.boolean :payed

      t.timestamps null: false
    end
  end
end
