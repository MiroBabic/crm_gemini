json.extract! invoice, :id, :implementation_id, :processed_date, :contracted_amount, :contracted_hours, :document_id, :done_hours, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
