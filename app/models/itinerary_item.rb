class ItineraryItem < ActiveRecord::Base

  validates :date, :start_time, :end_time, :city, :place, :itinerary, presence: true

  validate :date_must_be_within_itinerary_range, if: 'date.present?'

  belongs_to :itinerary

  private

  def date_must_be_within_itinerary_range
    errors.add(:date, 'Date must be within itinerary start date and end date') if date > itinerary.end_date || date < itinerary.start_date
  end

end
