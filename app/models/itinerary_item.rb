class ItineraryItem < ActiveRecord::Base

  validates :date, :start_time, :end_time, :city, :place, :itinerary, presence: true

  belongs_to :itinerary

end
