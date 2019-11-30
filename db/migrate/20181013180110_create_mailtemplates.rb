class CreateMailtemplates < ActiveRecord::Migration[4.2]
  def change
    create_table :mailtemplates do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
