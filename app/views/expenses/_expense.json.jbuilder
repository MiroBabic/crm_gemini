json.extract! expense, :id, :created_at, :updated_at, :about, :value_no_vat, :expense_date
json.url expense_url(expense, format: :json)
