require 'rails_helper'

RSpec.describe 'addresses/show', type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
                                  title: 'Title',
                                  body: 'MyText'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
