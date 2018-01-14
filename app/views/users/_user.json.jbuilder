json.extract! user, :id, :full_name, :charity_name, :charity_url, :donate_amount, :lectures_id, :events_id, :created_at, :updated_at
json.url user_url(user, format: :json)
