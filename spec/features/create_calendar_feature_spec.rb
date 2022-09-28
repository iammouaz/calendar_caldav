require 'rails_helper'

RSpec.feature 'CreateCalendarFeatures', type: :feature do
  scenario 'Create an calendar' do
    calendar = FactoryBot.create(:calendar)

    visit new_calendar_path

    create(calendar)

    expect(page).to have_content('Calendar was successfully created.')
  end

  private

  def create(calendar)
    fill_in 'Name', with: calendar.name
    fill_in 'Password', with: calendar.password
    click_button 'Create Calendar'
  end
end
