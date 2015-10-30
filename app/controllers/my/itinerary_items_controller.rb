class My::ItineraryItemsController < My::BaseController
  before_action :prepare_itinerary, only: [:new, :create]

  def new
    @itinerary_item = @itinerary.itinerary_items.build
  end

  def create
    @itinerary_item = @itinerary.itinerary_items.build(itinerary_item_params)

    if @itinerary_item.save
      redirect_to my_itinerary_path(@itinerary)
    else
      flash[:error] = @itinerary_item.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def prepare_itinerary
    @itinerary = current_user.itineraries.find(params[:itinerary_id])
  end

  def itinerary_item_params
    params.require(:itinerary_item).permit(:date, :start_time, :end_time, :place, :city)
  end
end
