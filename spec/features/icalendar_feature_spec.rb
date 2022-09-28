require 'rails_helper'
require 'icalendar'

RSpec.feature 'ICalendarFeature', type: :feature do
  scenario 'Generate a ics file and check if created' do
    events = []
    id = rand(+100)
    event = FactoryBot.create(:event)
    events.push(event)
    @cal = Icalendar::IcalendarService.new
    @ical_ics = @cal.generate_ical(events)
    File.write("public/ics/#{id}.ics", @ical_ics)

    expect(File.exist?("public/ics/#{id}.ics")).to be true
    delete_ics(id)
  end

  scenario 'Generate a ics file and check the content of it' do
    events = []
    id = rand(+100)
    event = FactoryBot.create(:event)
    events.push(event)
    @cal = Icalendar::IcalendarService.new
    @ical_ics = @cal.generate_ical(events)
    File.write("public/ics/#{id}.ics", @ical_ics)

    expect(File.read("public/ics/#{id}.ics")).to include('SUMMARY:New Meeting')
    expect(File.read("public/ics/#{id}.ics")).to include('LOCATION:Italy')
    expect(File.read("public/ics/#{id}.ics")).to include('DTEND:20220926T130000')
    delete_ics(id)
  end

  private
  def delete_ics(id)
    File.delete("public/ics/#{id}.ics")
  end
end
