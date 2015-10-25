require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'GET #new' do

    before { get :new }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:new) }

  end

  describe 'GET #create' do

    let(:user) { create(:user) }
    before { get :create, email: email, password: password }

    context 'with valid params' do

      let(:email) { user.email }
      let(:password) { 'password' }

      it { expect(response).to redirect_to(my_dashboard_path) }

    end

    context 'with invalid email' do

      let(:email) { '' }
      let(:password) { 'password'}

      it { expect(response).to render_template(:new) }

    end

    context 'with invalid password' do

      let(:email) { user.email }
      let(:password) { '' }

      it { expect(response).to render_template(:new) }

    end

  end

  describe 'GET #destroy' do

    before { delete :destroy }

    it { expect(response).to redirect_to(root_path) }

  end

end
