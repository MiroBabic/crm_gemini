class CreateMailtemplates < ActiveRecord::Migration
  def change
    create_table :mailtemplates do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
