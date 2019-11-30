class AddAddress2ToInvoices < ActiveRecord::Migration[4.2]
  def change
  	add_column :invoices, :corp_address2, :string
  end
end
