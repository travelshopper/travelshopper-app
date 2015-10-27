class Itinerary < ActiveRecord::Base

  validates :country_code, :start_date, :end_date, :user, presence: true

  belongs_to :user

  scope :order_by_latest, -> { order('created_at DESC') }

end
