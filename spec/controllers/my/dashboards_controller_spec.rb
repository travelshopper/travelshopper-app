require 'rails_helper'

RSpec.describe My::DashboardsController, type: :controller do
  describe 'GET #show' do
    context 'when logged in' do
      let(:user) { create(:user) }

      before do
        login_user(user)
        get :show
      end

      it { expect(response).to be_success }
    end

    context 'when not logged in' do
      before { get :show }

      it { expect(response).to redirect_to(root_path) }
    end
  end
end
