require 'rails_helper'

RSpec.feature 'CreateEventFeatures', type: :feature do
  scenario 'Create an calendar then create event in it' do
    calendar = FactoryBot.create(:calendar)
    event = FactoryBot.create(:event)

    visit new_calendar_path

    create_calendar(calendar)

    expect(page).to have_content('Calendar was successfully created.')

    visit "events/new?calendar=#{calendar.id}"

    create_event(event)

    expect(page).to have_content('Event was successfully created.')

    delete_ics(calendar.id)
  end

  private

  def create_calendar(calendar)
    fill_in 'Name', with: calendar.name
    fill_in 'Password', with: calendar.password
    click_button 'Create Calendar'
  end

  def create_event(event)
    fill_in 'Title', with: event.title
    fill_in 'Description', with: event.description
    fill_in 'Start date', with: event.start_date
    fill_in 'End date', with: event.end_date
    fill_in 'Location', with: event.location

    click_button 'Create Event'
  end

  def delete_ics(id)
    File.delete("public/ics/#{id}.ics")
  end
end
