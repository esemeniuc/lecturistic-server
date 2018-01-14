json.extract! lecture, :id, :user_id, :course_id, :date, :file_name, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
