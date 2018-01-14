json.extract! event, :id, :user_id, :course_id, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
