require 'icalendar'
module Icalendar
  extend ActiveSupport::Concern

  class IcalendarService
    attr_accessor :events

    def generate_ical(events)
      cal = Icalendar::Calendar.new
      events.each do |shift|
        e = Icalendar::Event.new
        e.dtstart = shift.start_date.strftime('%Y%m%dT%H%M%S')
        e.dtend = shift.end_date.strftime('%Y%m%dT%H%M%S')
        e.summary = shift.title
        e.description = shift.description
        e.location = shift.location
        cal.add_event(e)
      end
      cal.publish
      cal.to_ical
    end
  end
end
