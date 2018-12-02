class AddProjectTargetsstring < ActiveRecord::Migration
  def change
  	add_column :subjects,:project_targets_string, :text
  end
end