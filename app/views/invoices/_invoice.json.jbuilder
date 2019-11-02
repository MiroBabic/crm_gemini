json.extract! invoice, :id, :implementation_id, :processed_date, :contracted_amount, :contracted_hours, :document_id, :done_hours, :created_at, :updated_at,  :invoice_no, :status, :corp_name, :corp_address, :corp_address2, :corp_ico, :corp_dic, :corp_icdph, :invoice_create_date, :invoice_due_date, :delivery_date, :invoice_profile_id
json.url invoice_url(invoice, format: :json)
