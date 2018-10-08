json.extract! document, :id, :name, :type, :size, :user_id, :subject_id, :note, :created_at, :updated_at
json.url document_url(document, format: :json)
