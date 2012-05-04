require 'spec_helper'

describe "replies/index" do
  before(:each) do
    assign(:replies, [
      stub_model(Reply,
        :topic => nil,
        :user => nil,
        :subject => "Subject",
        :body => "MyText"
      ),
      stub_model(Reply,
        :topic => nil,
        :user => nil,
        :subject => "Subject",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of replies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
