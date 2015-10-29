class User < ActiveRecord::Base

  authenticates_with_sorcery!

  validates :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

  has_many :itineraries
  has_many :itinerary_items, through: :itineraries

end
