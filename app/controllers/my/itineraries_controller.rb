class My::ItinerariesController < My::BaseController

  def index
    @itineraries = current_user.itineraries.order_by_latest
  end

  def show
    @itinerary = current_user.itineraries.find(params[:id])
  end

end
