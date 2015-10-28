class Itinerary < ActiveRecord::Base

  validates :country_code, :start_date, :end_date, :user, presence: true

  with_options if: 'start_date.present?' do
    validate :start_date_must_be_future
    validate :end_date_must_be_later_than_start_date, if: 'end_date.present?'
  end

  belongs_to :user
  has_many :itinerary_items, dependent: :destroy

  scope :order_by_latest, -> { order('created_at DESC') }

  private

  def start_date_must_be_future
    errors.add(:start_date, 'Start date must be future') if start_date <= Date.today
  end

  def end_date_must_be_later_than_start_date
    errors.add(:end_date, 'End date must be later than start date') if end_date <= start_date
  end

end
