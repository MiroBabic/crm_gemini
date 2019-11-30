class AddFieldsToProcurement < ActiveRecord::Migration[4.2]
  def change
  	add_column :procurements,:procurer_name, :string
  	add_column :procurements,:approval_date, :datetime
  	add_column :procurements,:approval, :boolean
  	add_column :procurements,:status, :string
  	add_column :procurements,:note, :string
  end
end
