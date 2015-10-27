require 'rails_helper'

RSpec.describe My::ItinerariesController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #index' do

    context 'when logged in' do

      let!(:itineraries) { create_list(:itinerary, 2, user: user) }

      before do
        login_user(user)
        get :index
      end

      it { expect(response).to be_success }
      it { expect(assigns(:itineraries)).not_to be_empty }

    end

    context 'when not logged in' do

      before { get :index }

      it { expect(response).to redirect_to(root_path) }

    end

  end

  describe 'GET #show' do

    context 'when logged in' do

      before do
        login_user(user)
        get :show, id: id
      end

      context 'with valid id' do

        let(:id) { create(:itinerary, user: user).id }

        it { expect(assigns(:itinerary)).to be_persisted }

      end

      context 'with valid id' do

        let(:id) { '' }

        it { expect(response).to have_http_status(404) }

      end

    end

  end

end
