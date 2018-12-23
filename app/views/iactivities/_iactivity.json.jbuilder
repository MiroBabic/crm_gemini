json.extract! iactivity, :id, :implementation_id, :user_id, :action, :note, :created_at, :updated_at
json.url iactivity_url(iactivity, format: :json)
