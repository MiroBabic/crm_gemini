json.extract! mailtemplate, :id, :name, :content, :created_at, :updated_at
json.url mailtemplate_url(mailtemplate, format: :json)
