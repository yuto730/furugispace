class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_store!, only: %i[new edit]
  before_action :move_to_index, only: %i[edit update destory]

  def index
    @events = Event.order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @event = Event.new
    @event_details = @event.event_details.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @events = Event.order('created_at DESC')
  end

  def edit
    @event_details = @event.event_details.build
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :thumbnail, :event_display, :start_on, :end_on, :entry_fee, :prefecture_id,
                                  :event_address, :venue, event_details_attributes: %i[id event_id event_heading image event_description _destroy]).merge(store_id: current_store.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless @event.store_id == current_store.id
  end
end
