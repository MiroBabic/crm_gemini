class AddNameToUserProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :userprofiles, :name_acc1, :string
    add_column :userprofiles, :name_acc2, :string
    add_column :userprofiles, :name_acc3, :string
  end
end
