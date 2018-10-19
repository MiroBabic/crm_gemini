class AddPobyvToSubject < ActiveRecord::Migration
  def change
  	add_column :subjects, :citizen_count, :integer
  end
end
