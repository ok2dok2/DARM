class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end
  
  def create
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path, notice: "maked event"
    else
      redirect_to events_path, notice: "don't maked event"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :contact, :start_at, :introduce, :image, :tag_list)
  end


end
