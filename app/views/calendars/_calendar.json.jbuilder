json.extract! calendar, :id, :title, :start, :end, :url, :user_id, :all_day, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
