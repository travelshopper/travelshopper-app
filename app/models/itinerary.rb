class Itinerary < ActiveRecord::Base

  validates :country_code, :start_date, :end_date, presence: true

end
