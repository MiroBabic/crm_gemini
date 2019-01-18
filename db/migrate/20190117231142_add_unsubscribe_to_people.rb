class AddUnsubscribeToPeople < ActiveRecord::Migration
  def change
  	add_column :people,:unsubscribe, :boolean, :default=>false
  end
end
