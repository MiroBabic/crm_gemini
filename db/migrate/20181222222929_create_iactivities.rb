class CreateIactivities < ActiveRecord::Migration[4.2]
  def change
    create_table :iactivities do |t|
      t.references :implementation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.json :action
      t.integer :action_type
      t.string :note

      t.timestamps null: false
    end
  end
end
