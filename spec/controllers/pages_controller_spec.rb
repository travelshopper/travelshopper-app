require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #landing' do
    before { get :landing }

    it { expect(response).to be_success }
  end

end
