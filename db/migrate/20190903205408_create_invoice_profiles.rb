class CreateInvoiceProfiles < ActiveRecord::Migration[4.2]
  def change
    create_table :invoice_profiles do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :ico
      t.string :dic
      t.string :icdph
      t.string :bank_name
      t.string :iban

      t.timestamps null: false
    end
  end
end
