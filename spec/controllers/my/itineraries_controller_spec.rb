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

end
