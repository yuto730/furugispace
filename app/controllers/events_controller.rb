class EventsController < ApplicationController

  def index
    @events = Event.page(params[:page]).per(3)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit(:event_title,:thumbnail,:event_display,:start_on,:end_on,:entry_fee,:prefecture_id,:event_address,:venue,:event_heading,:image,:event_description).merge(store_id: current_store.id)
  end
end
