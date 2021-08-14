require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        title: "Title",
        body: "MyText"
      ),
      Address.create!(
        title: "Title",
        body: "MyText"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
