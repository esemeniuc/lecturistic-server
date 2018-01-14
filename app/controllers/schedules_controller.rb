class SchedulesController < ApplicationController

  # GET /schedules/:user_name
  def show
    # binding.pry
    user_name = params[:user_name]
    sql = 'SELECT events.course_id, courses.name as courses_name, courses.location, events.start, events.end FROM "events" JOIN "courses" ON "courses"."id" = "events"."course_id";'
    lectures_array = ActiveRecord::Base.connection.execute(sql)

    keepers = ["course_id", "courses_name", "location", "start", "end"]
    lectures_array.length.times do |i|
      lectures_array[i].slice!(*keepers)
    end
    render json: {
        user_id: User.find_by_user_name(user_name).id,
        lectures: lectures_array
    }
  end
end

{
    "user_id": 1,
    "lectures":
        [
            {
                "course_id": 2,
                "course_name": "CPSC 490",
                "location": "DMP110",
                "start": 12345678,
                "end": 12345699
            },
            {
                "course_id": 3,
                "course_name": "CPSC 418",
                "location": "MCLD100",
                "start": 22345678,
                "end": 22345699
            }
        ]
}