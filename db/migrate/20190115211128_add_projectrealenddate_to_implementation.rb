class AddProjectrealenddateToImplementation < ActiveRecord::Migration
  def change
  	add_column :implementations,:project_real_enddate, :datetime
  end
end
