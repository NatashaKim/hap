json.extract! event, :id, :name, :is_official, :created_at, :updated_at
json.url event_url(event, format: :json)
