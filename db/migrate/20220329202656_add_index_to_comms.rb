class AddIndexToComms < ActiveRecord::Migration[5.0]
  def change
     add_index :communications, :created_at
     add_index :communications, :updated_at
  end
end
