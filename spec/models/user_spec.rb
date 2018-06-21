# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  email                     :string           default(""), not null
#  first_name                :string
#  last_name                 :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  identity_url              :string
#  language                  :string           default("en"), not null
#  personnel_number          :integer
#  remaining_leave           :integer          default(28)
#  remaining_leave_last_year :integer          default(0)
#  superadmin                :boolean          default(FALSE)
#  username                  :string
#  encrypted_password        :string           default(""), not null
#  signature                 :text
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string
#  last_sign_in_ip           :string
#  event_settings            :string
#  include_comments          :integer          default(2)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'returns the full name of the user' do
    user = FactoryBot.create(:user, first_name: 'Joe', last_name: 'Doe')
    expect(user.name).to eq('Joe Doe')
  end

  it 'splits fullname into first and last name' do
    user = FactoryBot.create(:user, first_name: nil, last_name: nil, name: 'Jane Smith')
    expect(user.first_name).to eq('Jane')
    expect(user.last_name).to eq('Smith')
  end

  it 'checks functionality of is_wimi? function' do
    user = FactoryBot.create(:user)
    chair = FactoryBot.create(:chair)
    expect(user.is_wimi?).to eq(false)
    chairwimi = ChairWimi.create(user: user, chair: chair, application: 'accepted')
    expect(user.is_wimi?).to eq(true)
  end

  it 'checks functionality of is_hiwi? function' do
    user = FactoryBot.create(:user)
    project = FactoryBot.create(:project)
    expect(User.find(user.id).is_hiwi?).to eq(false)
    project.users << user
    expect(User.find(user.id).is_hiwi?).to eq(true)
  end

  it 'returns trips in the right order' do
    user = FactoryBot.create(:user)
    trip_a = FactoryBot.create(:trip, date_start: Date.today + 5, date_end: Date.today + 6, days_abroad: 0, user: user)
    trip_b = FactoryBot.create(:trip, date_start: Date.today + 10, date_end: Date.today + 16, days_abroad: 0, user: user)
    expect(user.get_desc_sorted_trips[0]).to eq(trip_b)
  end

  it 'is valid with no personnel_number' do
    expect(FactoryBot.build(:user, personnel_number: nil)).to be_valid
  end

  it 'returns whether a user has a contract for a given month' do
    user = FactoryBot.create(:user)
    today = Date.today
    start_date = today.beginning_of_month
    end_date = today.end_of_month
    contract = FactoryBot.create(:contract, hiwi: user, start_date: start_date, end_date: end_date)
    time_sheet = FactoryBot.create(:time_sheet, contract: contract, month: today.month)

    expect(user.has_contract_for(today.month, today.year)).to be true
    expect(user.has_contract_for((today + 1.month).month, (today + 1.month).year)).to be false
  end

  it 'fails when event_settings is passed non-integers' do
    u = FactoryBot.create(:user)
    u.event_settings = ['project_join', 'definitely_not_supported']
    expect(u).to_not be_valid
  end

  it 'sets the correct default value for PDF download prefs' do
    expect(User.create().include_comments).to eq('ask')
  end

  it 'allows the same email for different users' do
    expect{2.times{FactoryBot.create(:user, email: "a@example.com")}}.to change(User, :count).by(2)
  end
end
