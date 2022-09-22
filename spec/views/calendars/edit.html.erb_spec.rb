require 'rails_helper'

RSpec.describe "calendars/edit", type: :view do
  before(:each) do
    @calendar = assign(:calendar, Calendar.create!(
      name: "MyString",
      password: "MyString"
    ))
  end

  it "renders the edit calendar form" do
    render

    assert_select "form[action=?][method=?]", calendar_path(@calendar), "post" do

      assert_select "input[name=?]", "calendar[name]"

      assert_select "input[name=?]", "calendar[password]"
    end
  end
end
