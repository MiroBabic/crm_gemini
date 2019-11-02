class AddAddress2ToInvoices < ActiveRecord::Migration
  def change
  	add_column :invoices, :corp_address2, :string
  end
end
