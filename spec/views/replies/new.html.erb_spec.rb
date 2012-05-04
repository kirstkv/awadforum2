require 'spec_helper'

describe "replies/new" do
  before(:each) do
    assign(:reply, stub_model(Reply,
      :topic => nil,
      :user => nil,
      :subject => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path, :method => "post" do
      assert_select "input#reply_topic", :name => "reply[topic]"
      assert_select "input#reply_user", :name => "reply[user]"
      assert_select "input#reply_subject", :name => "reply[subject]"
      assert_select "textarea#reply_body", :name => "reply[body]"
    end
  end
end
