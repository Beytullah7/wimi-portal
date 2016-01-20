require 'rails_helper'

RSpec.describe 'holidays/index', type: :view do
  before(:each) do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in user1
    assign(:holidays, [
      FactoryGirl.create(:holiday, user: user1),
      FactoryGirl.create(:holiday, user: user2)
    ])
  end

  it 'renders a list of holidays' do
    render
    assert_select 'tr>td', text: 'saved'.to_s, count: 1
  end
end
