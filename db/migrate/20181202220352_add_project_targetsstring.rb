class AddProjectTargetsstring < ActiveRecord::Migration[4.2]
  def change
  	add_column :subjects,:project_targets_string, :text
  end
end