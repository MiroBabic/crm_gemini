class AddUnsubscribeToPeople < ActiveRecord::Migration[4.2]
  def change
  	add_column :people,:unsubscribe, :boolean, :default=>false
  end
end
