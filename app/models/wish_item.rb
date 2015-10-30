class WishItem < ActiveRecord::Base
  validates :itinerary_item, :description, presence: true

  belongs_to :itinerary_item
end
