class AddNotesToImplFields < ActiveRecord::Migration
  def change
  	add_column :implementations,:monitoring_note, :string
  	add_column :implementations,:change_request_note, :string
  	add_column :implementations,:publicity_note, :string
  end
end
