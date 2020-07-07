class CreateExternalCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :external_companies do |t|
      t.string :name
      t.string :url
      t.string :category
      t.jsonb :data
      t.string :web_source

      t.timestamps
    end

    add_index :external_companies, :url, unique: true
  end
end
