class AddArkToSubject < ActiveRecord::Migration[5.0]
  def change
  	add_column :subjects, :ark, :boolean, :default=>false
  end
end
