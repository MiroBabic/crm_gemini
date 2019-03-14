class AddchangereqToImplem < ActiveRecord::Migration
  def change
  	add_column :implementations,:change_request, :string
  	add_column :implementations,:change_request_last_term, :datetime
  	add_column :implementations,:change_request_approval, :boolean
  end
end
