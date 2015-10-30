require 'rails_helper'

RSpec.describe WishItem, type: :model do
  it { should validate_presence_of(:itinerary_item) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:itinerary_item) }
end
