class AddInvoiceProfileToInvoices < ActiveRecord::Migration
  def change
  	add_reference :invoices, :invoice_profile, index: true, foreign_key: true
  end
end
