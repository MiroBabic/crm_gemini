class AddOrsrZapisToInvoiceProfile < ActiveRecord::Migration
  def change
  	add_column :invoice_profiles, :orsr_entry, :text
  end
end
