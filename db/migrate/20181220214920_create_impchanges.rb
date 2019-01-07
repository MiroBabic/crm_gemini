class CreateImpchanges < ActiveRecord::Migration
  def change
    create_table :impchanges do |t|
      t.references :implementation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :change_last_term
      t.string :change_about
      t.string :change_status
      t.datetime :change_date

      t.timestamps null: false
    end
  end
end