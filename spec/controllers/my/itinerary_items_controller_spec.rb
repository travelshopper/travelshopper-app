require 'rails_helper'

RSpec.describe My::ItineraryItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:itinerary) { create(:itinerary, user: user) }

  describe 'GET #new' do
    before do
      login_user(user)
      get :new, itinerary_id: itinerary.id
    end

    it { expect(response).to render_template(:new) }
  end

  describe 'POST #create' do
    context 'when logged in' do
      before do
        login_user(user)
        post :create, itinerary_item: params, itinerary_id: itinerary.id
      end

      context 'with valid params' do
        let(:params) { attributes_for(:itinerary_item) }

        it { expect(assigns(:itinerary_item)).to be_persisted }
        it { expect(response).to redirect_to(my_itinerary_path(itinerary)) }
      end

      context 'with invalid params' do
        let(:params) { attributes_for(:itinerary_item, :blank_date) }

        it { expect(assigns(:itinerary_item)).not_to be_persisted }
        it { expect(response).to render_template(:new) }
      end
    end
  end
end
