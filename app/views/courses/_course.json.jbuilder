json.extract! course, :id, :name, :lectures_id, :created_at, :updated_at
json.url course_url(course, format: :json)
