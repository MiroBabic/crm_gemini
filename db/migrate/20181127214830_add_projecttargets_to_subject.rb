class AddProjecttargetsToSubject < ActiveRecord::Migration
  def change
  	add_column :subjects,:project_targets, :json
  end
end
