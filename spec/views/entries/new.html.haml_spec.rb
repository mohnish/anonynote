require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_title[name=?]", "entry[title]"
      assert_select "textarea#entry_body[name=?]", "entry[body]"
    end
  end
end
