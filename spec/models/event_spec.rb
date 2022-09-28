require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    @event = FactoryBot.create(:event)
  end

  it 'Valid Event data and valid attributes' do
    expect(@event).to be_valid
  end

  it 'is not valid without title' do
    event_invalid = FactoryBot.build(:event, title: nil)
    expect(event_invalid).to_not be_valid
  end

  it 'is not valid without description' do
    event_invalid = FactoryBot.build(:event, description: nil)
    expect(event_invalid).to_not be_valid
  end

  it 'is not valid without start date' do
    event_invalid = FactoryBot.build(:event, start_date: nil)
    expect(event_invalid).to_not be_valid
  end
  it 'is not valid without end date' do
    event_invalid = FactoryBot.build(:event, end_date: nil)
    expect(event_invalid).to_not be_valid
  end

  it 'is not valid without location' do
    event_invalid = FactoryBot.build(:event, location: nil)
    expect(event_invalid).to_not be_valid
  end

end
