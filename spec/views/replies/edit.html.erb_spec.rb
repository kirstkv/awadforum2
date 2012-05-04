require 'spec_helper'

describe "replies/edit" do
  before(:each) do
    @reply = assign(:reply, stub_model(Reply,
      :topic => nil,
      :user => nil,
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path(@reply), :method => "post" do
      assert_select "input#reply_topic", :name => "reply[topic]"
      assert_select "input#reply_user", :name => "reply[user]"
      assert_select "input#reply_subject", :name => "reply[subject]"
      assert_select "textarea#reply_body", :name => "reply[body]"
    end
  end
end
