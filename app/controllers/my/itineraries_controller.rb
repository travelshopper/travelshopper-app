class My::ItinerariesController < My::BaseController

  def index
    @itineraries = current_user.itineraries.order_by_latest
  end

  def show
    @itinerary = current_user.itineraries.find(params[:id])
  end

  def new
    @itinerary = current_user.itineraries.build
  end

  def create
    @itinerary = current_user.itineraries.build(itinerary_params)

    if @itinerary.save
      redirect_to my_itinerary_path(@itinerary), notice: 'Your itinerary has been created successfully.'
    else
      flash[:error] = @itinerary.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:start_date, :end_date, :country_code)
  end

end
