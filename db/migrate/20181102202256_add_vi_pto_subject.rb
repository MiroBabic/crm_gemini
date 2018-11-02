class AddViPtoSubject < ActiveRecord::Migration
  def change
  	add_column :subjects, :vip, :boolean, :default => false
  end
end
