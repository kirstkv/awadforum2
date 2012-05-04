require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :forum => nil,
      :user => nil,
      :subject => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_forum", :name => "topic[forum]"
      assert_select "input#topic_user", :name => "topic[user]"
      assert_select "input#topic_subject", :name => "topic[subject]"
      assert_select "textarea#topic_body", :name => "topic[body]"
    end
  end
end
