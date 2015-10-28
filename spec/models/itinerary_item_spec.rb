require 'rails_helper'

RSpec.describe ItineraryItem, type: :model do

  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:itinerary) }

  it { should belong_to(:itinerary) }

end
