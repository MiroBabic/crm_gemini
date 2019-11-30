class AddViPtoSubject < ActiveRecord::Migration[4.2]
  def change
  	add_column :subjects, :vip, :boolean, :default => false
  end
end
