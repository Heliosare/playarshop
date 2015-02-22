require 'spec_helper'

describe "games/show" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :user => nil,
      :nam => "Nam",
      :description => "Description",
      :year => "Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Nam/)
    rendered.should match(/Description/)
    rendered.should match(/Year/)
  end
end
