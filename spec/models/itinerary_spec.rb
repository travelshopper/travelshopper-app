require 'rails_helper'

RSpec.describe Itinerary, type: :model do

  it { should validate_presence_of(:country_code) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }
  it { should have_many(:itinerary_items).dependent(:destroy) }

end
