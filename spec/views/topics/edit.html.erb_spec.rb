require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :forum => nil,
      :user => nil,
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path(@topic), :method => "post" do
      assert_select "input#topic_forum", :name => "topic[forum]"
      assert_select "input#topic_user", :name => "topic[user]"
      assert_select "input#topic_subject", :name => "topic[subject]"
      assert_select "textarea#topic_body", :name => "topic[body]"
    end
  end
end
