require 'rails_helper'

RSpec.describe 'Create new Event Validtion', type: :system do
  describe 'New Event' do
    before do
      visit new_event_path
      @event = Event.create(title: 'Very Important Meeting', description: 'Meeting with Client', start: Time.now,
                            end: '2022-09-29T16:48', location: 'Damascus')
      page.fill_in 'Title', with: 'Very Important Meeting'
      page.fill_in 'Description', with: 'Meeting with Client'
      page.fill_in 'Start', with: Time.now
      page.fill_in 'End', with: '2022-09-29T16:48'
      page.fill_in 'location', with: 'Damascus'
      click_button('Create Event')
    end
    it 'should render the title of the event' do
      expect(page.find('.summary')).to have_content(@event.title)
    end
    it 'should render the description of the event' do
      expect(page.find('.description')).to have_content(@event.description)
    end
    it 'should render the location of the event' do
      expect(page.find('.location')).to have_content("$ #{@event.location}")
    end
  end
end
