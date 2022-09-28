require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before(:all) do
    @calendar = FactoryBot.create(:calendar)
  end

  it 'Valid Calendar data and valid attributes' do
    expect(@calendar).to be_valid
  end

  it 'is not valid without name' do
    calendar_invalid = FactoryBot.build(:calendar, name: nil)
    expect(calendar_invalid).to_not be_valid
  end

  it 'is not valid without a password' do
    calendar_invalid = FactoryBot.build(:calendar, password: nil)
    expect(calendar_invalid).to_not be_valid
  end
end
