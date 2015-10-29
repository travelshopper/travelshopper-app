class My::WishItemsController < My::BaseController

  before_action :prepare_itinerary_item, only: [:new, :create]

  def new
    @wish_item = @itinerary_item.wish_items.build
  end

  def create
    @wish_item = @itinerary_item.wish_items.build(wish_item_params)

    if @wish_item.save
      redirect_to my_itinerary_item_path(@itinerary_item)
    else
      flash[:error] = @wish_item.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def prepare_itinerary_item
    @itinerary_item = current_user.itinerary_items.find(params[:itinerary_item_id])
  end

  def wish_item_params
    params.require(:wish_item).permit(:description)
  end

end
