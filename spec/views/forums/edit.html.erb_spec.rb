require 'spec_helper'

describe "forums/edit" do
  before(:each) do
    @forum = assign(:forum, stub_model(Forum,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => forums_path(@forum), :method => "post" do
      assert_select "input#forum_name", :name => "forum[name]"
      assert_select "textarea#forum_description", :name => "forum[description]"
    end
  end
end
