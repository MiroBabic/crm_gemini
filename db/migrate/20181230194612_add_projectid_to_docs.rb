class AddProjectidToDocs < ActiveRecord::Migration[4.2]
  def change
  	add_reference :documents, :project, index: true
  end
end
