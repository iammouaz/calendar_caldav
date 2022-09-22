json.extract! event, :id, :title, :description, :start, :end, :location, :uid, :calendar_id, :created_at, :updated_at
json.url event_url(event, format: :json)
