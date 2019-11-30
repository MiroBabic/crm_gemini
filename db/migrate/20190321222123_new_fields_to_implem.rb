class NewFieldsToImplem < ActiveRecord::Migration[4.2]
  def change
  	add_column :implementations,:procurement_status, :string
  	add_column :implementations,:procurement_note, :string
  end
end
