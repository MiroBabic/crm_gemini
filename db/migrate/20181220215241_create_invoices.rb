class CreateInvoices < ActiveRecord::Migration[4.2]
  def change
    create_table :invoices do |t|
      t.references :implementation, index: true, foreign_key: true
      t.datetime :processed_date
      t.decimal :contracted_amount
      t.float :contracted_hours
      t.references :document, index: true, foreign_key: true
      t.float :done_hours

      t.timestamps null: false
    end
  end
end
