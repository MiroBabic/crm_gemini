class AddIsCityToSubject < ActiveRecord::Migration[5.0]
  def change
  	add_column :subjects, :is_city, :boolean, :default=>false
  end
end
