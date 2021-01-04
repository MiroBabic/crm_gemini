class AddAndRemoveInvoicesColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :invoices, :processed_date
  	remove_column :invoices, :implementation_id
  	remove_column :invoices, :document_id
  	add_column :invoices, :real_payment_date, :date
  end
end
