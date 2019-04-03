class AddRemoveColumnsImplementations < ActiveRecord::Migration
  def change
  	remove_column :implementations,:procurement_name, :string
  	remove_column :implementations,:procurement_subject, :string
  	remove_column :implementations,:procurement_control_date, :datetime
  	remove_column :implementations,:procurement_approval_date, :datetime
  	remove_column :implementations,:procurement_approval, :boolean
  	remove_column :implementations,:procurement_status, :string
  	remove_column :implementations,:procurement_note, :string
  	add_column :implementations,:procurements_string, :string
  	add_column :implementations,:procurements, :json
  end
end
