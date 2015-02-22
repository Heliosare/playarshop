require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :user => nil,
        :nam => "Nam",
        :description => "Description",
        :year => "Year"
      ),
      stub_model(Game,
        :user => nil,
        :nam => "Nam",
        :description => "Description",
        :year => "Year"
      )
    ])
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nam".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
  end
end
