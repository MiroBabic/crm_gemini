class AddFieldsToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices,:invoice_no, :string
  	add_column :invoices,:invoice_text, :text
  	add_column :invoices,:corp_name, :string
  	add_column :invoices,:corp_ico, :string
  	add_column :invoices,:corp_dic, :string
  	add_column :invoices,:corp_icdph, :string
  	add_column :invoices,:corp_address, :string
  	add_column :invoices,:const_symbol, :string
  	add_column :invoices,:invoice_create_date, :date
  	add_column :invoices,:delivery_date, :date
  	add_column :invoices,:invoice_due_date, :date
  	add_column :invoices,:payment_type, :string
  	add_column :invoices,:status, :string

  end
end
