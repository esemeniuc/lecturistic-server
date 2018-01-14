json.extract! user, :id, :full_name, :user_name, :charity_name, :charity_url, :donate_amount, :created_at, :updated_at
json.url user_url(user, format: :json)
