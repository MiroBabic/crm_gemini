class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|

      t.string :about
      t.float :value_no_vat
      t.date :expense_date
      t.timestamps
    end
  end
end
