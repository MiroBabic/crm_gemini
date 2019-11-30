class AddIndextoDelayed < ActiveRecord::Migration[4.2]
  def change
  	 add_index :delayed_jobs, [:queue], :name => 'delayed_jobs_queue'
  end
end
