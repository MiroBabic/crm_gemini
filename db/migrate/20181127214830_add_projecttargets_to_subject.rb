class AddProjecttargetsToSubject < ActiveRecord::Migration[4.2]
  def change
  	add_column :subjects,:project_targets, :json
  end
end
