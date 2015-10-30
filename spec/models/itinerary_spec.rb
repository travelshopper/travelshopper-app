require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  it { should validate_presence_of(:country_code) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }
  it { should have_many(:itinerary_items).dependent(:destroy) }

  context 'start date must be future' do
    subject { build(:itinerary, start_date: Time.zone.today) }

    it { is_expected.not_to be_valid }
  end

  context 'end date must be later than start date' do
    subject { build(:itinerary, start_date: Time.zone.today, end_date: Time.zone.today) }

    it { is_expected.not_to be_valid }
  end
end
