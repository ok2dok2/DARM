class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @events = Event.all
    if params[:tag]
      @events = Event.tagged_with(params[:tag], wild: true)
    end
    @event = Event.new
  end
  
  def create
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path, notice: t("maked event")
    else
      @events = Event.all
      render :index, notice: t("don't maked event")
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :contact, :start_at, :introduce, :image, :tag_list)
  end


end
