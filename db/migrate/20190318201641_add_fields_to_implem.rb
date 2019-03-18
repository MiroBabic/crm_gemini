class AddFieldsToImplem < ActiveRecord::Migration
  def change
  	add_column :implementations,:nfp_contract_effective, :datetime
  	add_column :implementations,:project_request_code, :string
  	add_column :implementations,:project_status, :string
  	add_column :implementations,:procurement_name, :string
  	add_column :implementations,:procurement_subject, :string
  	add_column :implementations,:procurement_control_date, :datetime
  	add_column :implementations,:procurement_approval_date, :datetime
  	add_column :implementations,:procurement_approval, :boolean

  end
end
