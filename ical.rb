require('icalendar')

cal_file = File.open("ical.ics")

# Parser returns an array of calendars because a single file can have multiple calendars.
cals = Icalendar::Calendar.parse(cal_file)
cal = cals.first

