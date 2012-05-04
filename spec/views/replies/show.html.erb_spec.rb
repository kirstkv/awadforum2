require 'spec_helper'

describe "replies/show" do
  before(:each) do
    @reply = assign(:reply, stub_model(Reply,
      :topic => nil,
      :user => nil,
      :subject => "Subject",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
