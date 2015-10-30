require 'rails_helper'

RSpec.describe ItineraryItem, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:itinerary) }

  it { should belong_to(:itinerary) }
  it { should have_many(:wish_items).dependent(:destroy) }

  context 'date must within itinerary range' do
    context 'when date < itinerary start date' do
      let(:itinerary) { create(:itinerary) }

      subject { build(:itinerary_item, itinerary: itinerary, date: itinerary.start_date - 1.day) }

      it { is_expected.not_to be_valid }
    end

    context 'when date > itinerary end date' do
      let(:itinerary) { create(:itinerary) }

      subject { build(:itinerary_item, itinerary: itinerary, date: itinerary.end_date + 1.day) }

      it { is_expected.not_to be_valid }
    end
  end

  context 'end time must be later than start time' do
    let(:now) { Time.zone.now }
    subject { build(:itinerary_item, start_time: now, end_time: now) }

    it { is_expected.not_to be_valid }
  end
end
