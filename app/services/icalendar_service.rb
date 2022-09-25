require 'icalendar'
module Icalendar
  extend ActiveSupport::Concern

  class IcalendarService
    attr_accessor :events

    def generate_ical(events)
      cal = Icalendar::Calendar.new
      events.each do |shift|
        e = Icalendar::Event.new
        e.dtstart = shift.start.strftime('%Y%m%dT%H%M%S')
        e.dtend = shift.end.strftime('%Y%m%dT%H%M%S')
        e.summary = shift.title
        e.description = shift.description
        e.location = shift.location
        e.uid = e.url = shift.uid
        cal.add_event(e)
      end
      cal.publish
      cal.to_ical
    end
  end
end
