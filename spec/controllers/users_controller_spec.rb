require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:new) }
    it { expect(assigns(:user)).to be_new_record }
  end

  describe 'GET #create' do
    before { get :create, user: params }

    context 'with valid params' do
      let(:params) { { email: 'user@ts.com', password: 'password', password_confirmation: 'password' } }

      it { expect(response).to redirect_to(my_dashboard_path) }
      it { expect(assigns(:user)).to be_persisted }
    end

    context 'with invalid email' do
      let(:params) { { email: '', password: 'password', password_confirmation: 'password' } }

      it { expect(response).to be_success }
      it { expect(response).to render_template(:new) }
      it { expect(assigns(:user)).not_to be_persisted }
    end
  end
end
