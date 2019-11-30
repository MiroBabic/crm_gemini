class AddInvoiceProfileToInvoices < ActiveRecord::Migration[4.2]
  def change
  	add_reference :invoices, :invoice_profile, index: true, foreign_key: true
  end
end
