require 'rails_helper'

RSpec.describe "calendars/index", type: :view do
  before(:each) do
    assign(:calendars, [
      Calendar.create!(
        name: "Name",
        password: "Password"
      ),
      Calendar.create!(
        name: "Name",
        password: "Password"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
  end
end
