class AddProjectrealenddateToImplementation < ActiveRecord::Migration[4.2]
  def change
  	add_column :implementations,:project_real_enddate, :datetime
  end
end
