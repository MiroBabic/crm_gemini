class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :file_name
      t.string :file_type
      t.string :file_size
      t.string :file
      t.string :file_url
      t.string :file_path
      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.string :note

      t.timestamps null: false
    end
  end
end
