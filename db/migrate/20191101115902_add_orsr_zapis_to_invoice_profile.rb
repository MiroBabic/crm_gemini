class AddOrsrZapisToInvoiceProfile < ActiveRecord::Migration[4.2]
  def change
  	add_column :invoice_profiles, :orsr_entry, :text
  end
end
