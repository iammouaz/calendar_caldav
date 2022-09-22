require 'rails_helper'

RSpec.describe "calendars/new", type: :view do
  before(:each) do
    assign(:calendar, Calendar.new(
      name: "MyString",
      password: "MyString"
    ))
  end

  it "renders new calendar form" do
    render

    assert_select "form[action=?][method=?]", calendars_path, "post" do

      assert_select "input[name=?]", "calendar[name]"

      assert_select "input[name=?]", "calendar[password]"
    end
  end
end
