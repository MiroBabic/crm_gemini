class NewFieldsToImplem < ActiveRecord::Migration
  def change
  	add_column :implementations,:procurement_status, :string
  	add_column :implementations,:procurement_note, :string
  end
end
