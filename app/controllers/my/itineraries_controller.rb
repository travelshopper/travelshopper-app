class My::ItinerariesController < My::BaseController

  def index
    @itineraries = current_user.itineraries.order_by_latest
  end

end
