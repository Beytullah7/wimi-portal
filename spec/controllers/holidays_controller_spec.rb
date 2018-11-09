require 'rails_helper'
require 'spec_helper'

# holidays currently out of order
RSpec.describe HolidaysController, type: :controller do
#  before(:each) do
#    wimi = FactoryGirl.create(:wimi, chair: FactoryGirl.create(:chair))
#    @user = wimi.user
#    sign_in @user
#  end
#
#  # This should return the minimal set of attributes required to create a valid
#  # Holiday. As you add validations to Holiday, be sure to
#  # adjust the attributes here as well.
#  let(:valid_attributes) {
#    {start: Date.today, end: Date.today + 1, user: @user, length: 1}
#  }
#
#  let(:invalid_attributes) {
#    {start: Date.today, end: Date.today - 1, user: @user, length: 1}
#  }
#
#  let(:checked_valid_attributes) {
#    {start: I18n.l(Date.today), end: I18n.l(Date.today + 1), user: @user, length: 1}
#  }
#
#  let(:signature_valid_attributes) {
#    {start: I18n.l(Date.today), end: I18n.l(Date.today + 1), user: @user, length: 1, signature: 1}
#  }
#
#  let(:checked_invalid_attributes) {
#    {start: I18n.l(Date.today), end: I18n.l(Date.today - 1), user: @user, length: 1}
#  }
#
#  # This should return the minimal set of values that should be in the session
#  # in order to pass any filters (e.g. authentication) defined in
#  # HolidaysController. Be sure to keep this updated too.
#  let(:valid_session) { {} }
#
#  describe 'GET #index' do
#    it 'assigns all holidays as @holidays (wimi only)' do
#      chair = FactoryGirl.create(:chair)
#      ChairWimi.first.update_attributes(user: @user)
#      Holiday.create! valid_attributes
#      get :index, {}, valid_session
#      expect(assigns(:holidays)).to eq(Holiday.all)
#    end
#  end
#
#  describe 'GET #show' do
#    it 'assigns the requested holiday as @holiday' do
#      holiday = Holiday.create! valid_attributes
#      get :show, {id: holiday.to_param}, valid_session
#      expect(assigns(:holiday)).to eq(holiday)
#    end
#
#    it 'does not show holidays for normal user' do
#      user = FactoryGirl.create(:user)
#      sign_in user
#      holiday = Holiday.create! valid_attributes
#      get :show, {id: holiday.to_param}, valid_session
#      expect(response).to have_http_status(302)
#      expect(response).to redirect_to(root_path)
#    end
#
#    it 'redirects to the root path if holiday belongs to another user' do
#      user2 = FactoryGirl.create(:user)
#      holiday = FactoryGirl.create(:holiday, user: user2)
#      get :show, {id: holiday.to_param}, valid_session
#      expect(response).to redirect_to(root_path)
#    end
#  end
#
#  describe 'GET #new' do
#    it 'assigns a new holiday as @holiday' do
#      chair = FactoryGirl.create(:chair)
#      ChairWimi.first.update_attributes(user: @user)
#      get :new, {}, valid_session
#      expect(assigns(:holiday)).to be_a_new(Holiday)
#    end
#  end
#
#  describe 'GET #edit' do
#    it 'assigns the requested holiday as @holiday' do
#      holiday = Holiday.create! valid_attributes
#      get :edit, {id: holiday.to_param}, valid_session
#      expect(assigns(:holiday)).to eq(holiday)
#    end
#  end
#
#  describe 'POST #create' do
#    context 'with valid params' do
#      it 'creates a new Holiday' do
#        expect {
#          post :create, {holiday: checked_valid_attributes}, valid_session
#        }.to change(Holiday, :count).by(1)
#      end
#
#      it 'does not save the signature if absent' do
#        expect {
#          post :create, {holiday: signature_valid_attributes}, valid_session
#        }.to change(Holiday, :count).by(1)
#
#        expect(Holiday.last.signature).to eq(false)
#        assert_equal 'You have selected to sign the document, but there was no signature found', flash[:error]
#      end
#
#      it 'saves the signature if present' do
#        @user.update(signature: 'Signature')
#        expect {
#          post :create, {holiday: signature_valid_attributes}, valid_session
#        }.to change(Holiday, :count).by(1)
#
#        expect(Holiday.last.signature).to eq(true)
#        expect(Holiday.last.user_signature).to_not eq(nil)
#        expect(Holiday.last.user_signed_at).to_not eq(nil)
#      end
#
#      it 'assigns a newly created holiday as @holiday' do
#        post :create, {holiday: checked_valid_attributes}, valid_session
#        expect(assigns(:holiday)).to be_a(Holiday)
#        expect(assigns(:holiday)).to be_persisted
#      end
#
#      it 'redirects to the holiday detail page' do
#        post :create, {holiday: checked_valid_attributes}, valid_session
#        expect(response).to redirect_to(assigns(:holiday))
#      end
#    end
#
#    context 'with invalid params' do
#      it 'assigns a newly created but unsaved holiday as @holiday' do
#        post :create, {holiday: checked_invalid_attributes}, valid_session
#        expect(assigns(:holiday)).to be_a_new(Holiday)
#      end
#
#      it "re-renders the 'new' template" do
#        post :create, {holiday: checked_invalid_attributes}, valid_session
#        expect(response).to render_template('new')
#      end
#    end
#  end
#
#  describe 'PUT #update' do
#    context 'with valid params' do
#      let(:new_attributes) {
#        {start: I18n.l(Date.today), end: I18n.l(Date.today + 1), user: @user, length: 1, status: 'applied'}
#      }
#
#      it 'updates the requested holiday' do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: new_attributes}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('applied')
#      end
#
#      it 'assigns the requested holiday as @holiday' do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: checked_valid_attributes}, valid_session
#        expect(assigns(:holiday)).to eq(holiday)
#      end
#
#      it 'redirects to the holiday' do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: checked_valid_attributes}, valid_session
#        expect(response).to redirect_to(holiday)
#      end
#
#      it 'calculates the length if no length is entered' do
#        holiday = Holiday.create! valid_attributes
#        holiday.update_attribute(:length, 2)
#        put :update, {id: holiday.to_param, holiday: {start: I18n.l(Date.today), end: I18n.l(Date.today + 1), user: @user, length: ''}}
#        holiday.reload
#        expect(holiday.length).to eq(holiday.duration)
#      end
#
#      it 'does not save signature if absent' do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: signature_valid_attributes}, valid_session
#        expect(Holiday.last.signature).to eq(false)
#        assert_equal 'You have selected to sign the document, but there was no signature found', flash[:error]
#      end
#
#      it 'saves the signature if chosen' do
#        @user.update(signature: 'Signature')
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: signature_valid_attributes}, valid_session
#        expect(Holiday.last.signature).to eq(true)
#        expect(Holiday.last.user_signature).to_not eq(nil)
#        expect(Holiday.last.user_signed_at).to_not eq(nil)
#      end
#    end
#
#    context 'with invalid params' do
#      it 'assigns the holiday as @holiday' do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: checked_invalid_attributes}, valid_session
#        expect(assigns(:holiday)).to eq(holiday)
#      end
#
#      it "re-renders the 'edit' template" do
#        holiday = Holiday.create! valid_attributes
#        put :update, {id: holiday.to_param, holiday: checked_invalid_attributes}, valid_session
#        expect(response).to render_template('edit')
#      end
#
#      it 'redirects to the holiday, if it is already applied' do
#        holiday = Holiday.create! valid_attributes
#        holiday.update_attributes(status: 'applied')
#        get :edit, {id: holiday.id}
#        expect(response).to have_http_status(302)
#        expect(response).to redirect_to(holiday_path(holiday))
#      end
#    end
#  end
#
#  describe 'DELETE #destroy' do
#    it 'destroys the requested holiday' do
#      holiday = Holiday.create! valid_attributes
#      expect {
#        delete :destroy, {id: holiday.to_param}, valid_session
#      }.to change(Holiday, :count).by(-1)
#    end
#
#    it 'redirects to the holidays list' do
#      holiday = Holiday.create! valid_attributes
#      delete :destroy, {id: holiday.to_param}, valid_session
#      expect(response).to redirect_to(holidays_url)
#    end
#
#    it 'can not destroy applied holiday' do
#      holiday = Holiday.create! valid_attributes
#      holiday.user = @user
#      login_with(@user)
#      get :file, {id: holiday.id}, valid_session
#      expect {
#        delete :destroy, {id: holiday.to_param}, valid_session
#      }.to change(Holiday, :count).by(0)
#    end
#  end
#
#  describe 'GET #file' do
#    context 'with valid params' do
#      it 'subtracts the length from the users remaining leave' do
#        old_remaining_leave = @user.remaining_leave
#        holiday = FactoryGirl.create(:holiday, user: @user)
#        get :file, {id: holiday.to_param}, valid_session
#        @user.reload
#        expect @user.remaining_leave == old_remaining_leave - holiday.length
#      end
#
#      it 'redirects to the users page' do
#        holiday = FactoryGirl.create(:holiday, user: @user)
#        get :file, {id: holiday.to_param}, valid_session
#        expect(response).to redirect_to(@user)
#      end
#
#      it 'updates the status' do
#        holiday = FactoryGirl.create(:holiday, user: @user)
#        get :file, {id: holiday.to_param}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('applied')
#      end
#    end
#
#    context 'with invalid params' do
#      it 'leaves remaining leave unchanged' do
#        @user.update(remaining_leave: 20)
#        holiday = Holiday.create! valid_attributes
#        holiday.update_attribute(:status, 'accepted')
#        get :file, {id: holiday.to_param}, valid_session
#        @user.reload
#        expect @user.remaining_leave == 20
#      end
#
#      it 'redirects to the holiday page' do
#        holiday = Holiday.create! valid_attributes
#        holiday.update_attribute(:status, 'accepted')
#        get :file, {id: holiday.to_param}, valid_session
#        expect(response).to redirect_to(root_path)
#      end
#
#      it 'does not file the request if it has the wrong status' do
#        holiday = Holiday.create! valid_attributes
#        holiday.update_attribute(:status, 'accepted')
#        get :file, {id: holiday.id}, valid_session
#        expect(Holiday.find(holiday.id).status).to eq('accepted')
#      end
#    end
#
#    context 'called by an unauthorized user' do
#      it 'does not file the request' do
#        user = FactoryGirl.create(:user)
#        holiday = Holiday.create! valid_attributes
#        holiday.user = user
#        login_with(user)
#        get :file, {id: holiday.id}, valid_session
#        expect(Holiday.find(holiday.id).status).to eq('saved')
#      end
#    end
#  end
#
#  describe 'GET #reject' do
#    context 'with valid params' do
#      it 'adds the length to the users remaining leave' do
#        old_remaining_leave = @user.remaining_leave
#        holiday = FactoryGirl.create(:holiday, user: @user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Reject Request', holiday: {length: holiday.length}}, valid_session
#        @user.reload
#        expect @user.remaining_leave == old_remaining_leave + holiday.length
#      end
#
#      it 'redirects to the users page' do
#        chair = FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        user2 = FactoryGirl.create(:user, chair: chair)
#        holiday = FactoryGirl.create(:holiday, user: user2, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Reject Request', holiday: {length: holiday.length}}, valid_session
#        expect(response).to redirect_to(user2)
#      end
#
#      it 'updates the status' do
#        chair = FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        wimi = FactoryGirl.create(:wimi, chair: chair)
#        holiday = FactoryGirl.create(:holiday, user: wimi.user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Reject Request', holiday: {length: holiday.length}}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('declined')
#      end
#    end
#
#    context 'with invalid params' do
#      it 'redirects to the root path if an unauthorized person wants to reject it' do
#        sign_in FactoryGirl.create(:user)
#        holiday = FactoryGirl.create(:holiday, user: @user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Reject Request', holiday: {length: holiday.length}}, valid_session
#        expect(response).to redirect_to(root_path)
#      end
#
#      it 'does not change the status if representative wants to reject his own request' do
#        FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        holiday = FactoryGirl.create(:holiday, user: @user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Reject Request', holiday: {length: holiday.length}}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('applied')
#      end
#    end
#  end
#
#  describe 'GET #accept' do
#    context 'with valid params' do
#      it 'redirects to the users page' do
#        chair = FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        user2 = FactoryGirl.create(:user, chair: chair)
#        holiday = FactoryGirl.create(:holiday, user: user2, status: 'applied')
#        @user.signature = 'Signature'
#        get :accept_reject, {id: holiday.to_param, commit: 'Accept Request', holiday: {length: holiday.length}}, valid_session
#        expect(response).to redirect_to(user2)
#      end
#
#      it 'updates the status' do
#        chair = FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        wimi = FactoryGirl.create(:wimi, chair: chair)
#        holiday = FactoryGirl.create(:holiday, user: wimi.user, status: 'applied')
#        @user.signature = 'Signature'
#        get :accept_reject, {id: holiday.to_param, commit: 'Accept Request', holiday: {length: holiday.length}}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('accepted')
#      end
#    end
#
#    context 'with invalid params' do
#      it 'redirects to the root path if an unauthorized person wants to reject it' do
#        sign_in FactoryGirl.create(:user)
#        holiday = FactoryGirl.create(:holiday, user: @user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Accept Request', holiday: {length: holiday.length}}, valid_session
#        expect(response).to redirect_to(root_path)
#      end
#
#      it 'does not change the status if representative wants to accept his own request' do
#        FactoryGirl.create(:chair)
#        ChairWimi.first.update_attributes(user: @user, representative: true)
#        holiday = FactoryGirl.create(:holiday, user: @user, status: 'applied')
#        get :accept_reject, {id: holiday.to_param, commit: 'Accept Request', holiday: {length: holiday.length}}, valid_session
#        holiday.reload
#        expect(holiday.status).to eq('applied')
#      end
#    end
#  end
end