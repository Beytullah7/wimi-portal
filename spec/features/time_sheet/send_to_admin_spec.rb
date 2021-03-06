require 'rails_helper'
require 'cancan/matchers'

describe 'timesheet#show' do
  context 'with an accepted time sheet' do
    before :all do
      @contract = FactoryGirl.create(:contract)
      @time_sheet = FactoryGirl.create(:time_sheet_accepted, contract: @contract)
      @user = @time_sheet.user
      @wimi = @time_sheet.contract.responsible
    end

    it 'should allow the responsible wimi to send the pdf to the admin' do
      ability = Ability.new(@wimi)
      expect(ability).to be_able_to(:send_to_admin, @time_sheet)
    end

    it 'should have a button for sending the pdf to the admin' do
      login_as @wimi
      visit time_sheet_path(@time_sheet)
      expect(page).to have_selector(:linkhref, send_to_admin_time_sheet_path(@time_sheet))
    end
  end
end
