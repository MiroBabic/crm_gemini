json.extract! invoice_profile, :id, :name, :address1, :address2, :ico, :dic, :icdph, :bank_name, :iban, :created_at, :updated_at,:orsr_entry
json.url invoice_profile_url(invoice_profile, format: :json)
