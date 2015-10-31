class WishItem < ActiveRecord::Base
  validates :itinerary_item, :description, presence: true

  belongs_to :itinerary_item
  has_many :wish_item_images, dependent: :destroy
end
