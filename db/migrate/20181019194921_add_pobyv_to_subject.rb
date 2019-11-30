class AddPobyvToSubject < ActiveRecord::Migration[4.2]
  def change
  	add_column :subjects, :citizen_count, :integer
  end
end
