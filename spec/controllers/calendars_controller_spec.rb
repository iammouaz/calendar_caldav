require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  before(:each) do
    @calendar = FactoryBot.create(:calendar)
    visit new_calendar_path
    expect(response).to render_template('new')
    create(@calendar)
  end

  private

  def create(calendar)
    fill_in 'Name', with: calendar.name
    fill_in 'Password', with: calendar.password
    click_button 'Create Calendar'
  end
end
