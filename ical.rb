require('icalendar')
require('pry')

cal_file = File.open("ical.ics")

# Parser returns an array of calendars because a single file can have multiple calendars.
cals = Icalendar::Calendar.parse(cal_file)
cal = cals.first

unique_course = cal.events.first.summary
current_course = cal.events.first.summary
new_course_id = 1

# all = [] # for debugging

(0..cal.events.length-1).step(1).each do |index|
  # todo determine user_id
  if current_course != unique_course
    # create database entry
    # todo determine user_id
    Event.create(user_id: 1, course_id: new_course_id, start: cal.events[index].dtstart, end: cal.events[index].dtend)
    # all.append([1, new_course_id, cal.events[index].dtstart, cal.events[index].dtend])
    # set new course
    new_course_id += 1
    unique_course = cal.events[index].summary
  end
  current_course = cal.events[index].summary
end
