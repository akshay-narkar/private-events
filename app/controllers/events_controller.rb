class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @eventspast = Event.past
    @eventsupcoming = Event.upcoming
  end

  def create
    @user = User.find_by_id(session[:user_id])
    @event = @user.events.build(event_params)

    if @event.save
      redirect_to root_path, notice: 'Event successfully created'
    else
      redirect_to new_event, notice: 'Failed to create event. Try again'
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @attended = @event.attendances.all
  end

  private

  def event_params
    params.require(:@event123).permit(:description, :eventdate)
  end
end
