json.extract! registration, :id, :user_name, :full_name, :file_upload, :created_at, :updated_at
json.url registration_url(registration, format: :json)
