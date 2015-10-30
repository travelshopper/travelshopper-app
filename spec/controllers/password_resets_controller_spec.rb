require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  let!(:user) { create(:user) }

  describe 'POST #create' do
    before { post :create, params }

    context 'with valid email' do
      let(:params) { { email: user.email } }

      it { expect(response).to redirect_to(root_path) }
      it { expect(assigns(:user)).to be_persisted }
    end

    context 'with invalid email' do
      let(:params) { { email: 'unknown@example.com' } }

      it { expect(response).to redirect_to(root_path) }
      it { expect(assigns(:user)).to be_nil }
    end
  end

  describe 'GET #edit' do
    before { get :edit, params }

    context 'with valid token' do
      let(:params) do
        user.generate_reset_password_token!
        { id: user.reload.reset_password_token }
      end

      it { expect(response).to render_template(:edit) }
      it { expect(assigns(:user)).to be_persisted }
    end

    context 'with invalid token' do
      let(:params) { { id: 'unknown' } }

      it { expect(response).to redirect_to(root_path) }
      it { expect(assigns(:user)).to be_nil }
    end
  end

  describe 'PUT #update' do
    before { put :update, params }

    context 'with valid token' do
      let(:token) do
        user.generate_reset_password_token!
        user.reload.reset_password_token
      end

      context 'with valid password' do
        let(:params) do
          { id: token,
            user: { password: 'password', password_confirmation: 'password' } }
        end

        it { expect(response).to redirect_to(root_path) }
        it { expect(assigns(:user)).to be_persisted }
      end

      context 'with invalid password' do
        let(:params) do
          { id: token,
            user: { password: 'passwor', password_confirmation: 'passwor' } }
        end

        it { expect(response).to render_template(:edit) }
        it { expect(assigns(:user)).to be_persisted }
      end
    end

    context 'with invalid token' do
      let(:params) do
        { id: 'unknown',
          user: { password: 'password', password_confirmation: 'password' } }
      end

      it { expect(response).to redirect_to(root_path) }
      it { expect(assigns(:user)).to be_nil }
    end
  end
end
