require 'rails_helper'

RSpec.describe My::WishItemsController, type: :controller do

  let(:user) { create(:user) }
  let(:itinerary) { create(:itinerary, user: user) }
  let(:itinerary_item) { create(:itinerary_item, itinerary: itinerary) }

  describe 'GET #new' do

    before do
      login_user(user)
      get :new, itinerary_item_id: itinerary_item.id
    end

    it { expect(response).to render_template(:new) }

  end

  describe 'POST #create' do

    before do
      login_user(user)
      post :create, wish_item: params, itinerary_item_id: itinerary_item.id
    end

    context 'with valid params' do

      let(:params) { attributes_for(:wish_item) }

      it { expect(assigns(:wish_item)).to be_persisted }

    end

    context 'with invalid params' do

      let(:params) { attributes_for(:wish_item, :blank_description) }

      it { expect(assigns(:wish_item)).not_to be_persisted }
      it { expect(response).to render_template(:new) }

    end

  end

end
