class AddIsVillageToSubjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :subjects, :is_village,  :boolean, :default=>false
  end
end
