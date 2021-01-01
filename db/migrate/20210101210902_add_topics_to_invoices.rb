class AddTopicsToInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :invoices, :payment_status, :boolean, :default=>false
  end
end
