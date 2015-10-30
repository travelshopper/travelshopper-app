class ItineraryItem < ActiveRecord::Base
  validates :date, :start_time, :end_time, :city, :place, :itinerary, presence: true

  validate :date_must_be_within_itinerary_range, if: 'date.present?'
  validate :end_time_must_be_later_than_start_time, if: 'start_time.present? && end_time.present?'

  belongs_to :itinerary
  has_many :wish_items, dependent: :destroy

  private

  def date_must_be_within_itinerary_range
    errors.add(:date, 'Date must be within itinerary start date and end date') if date > itinerary.end_date || date < itinerary.start_date
  end

  def end_time_must_be_later_than_start_time
    errors.add(:end_time, 'End time must be later than start time') if end_time <= start_time
  end
end
