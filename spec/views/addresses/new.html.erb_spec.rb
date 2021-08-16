require 'rails_helper'

RSpec.describe 'addresses/new', type: :view do
  before(:each) do
    assign(:address, Address.new(
                       title: 'MyString',
                       body: 'MyText'
                     ))
  end

  it 'renders new address form' do
    render

    assert_select 'form[action=?][method=?]', addresses_path, 'post' do
      assert_select 'input[name=?]', 'address[title]'

      assert_select 'textarea[name=?]', 'address[body]'
    end
  end
end
