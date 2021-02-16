class EventsController < ApplicationController

    def new 
        @event = Event.new
    end

    def index
         @events = Event.all
    end

    def create                     1
        @user = User.find_by_id(session[:user_id])
        @event = @user.events.build(event_params) 
        # render plain: @event

        if @event.save
            redirect_to root_path
        else
            render :new
        end
        # render plain: event_params
    #    @event = @user.events.build(event_params) 
        # if @event
        #     redirect_to root_path
        # else 
        #     render :new
        # @event = Event.new(event_params)
    end

    def show
        @event = Event.find_by(params[:id])
    end

private 
    def event_params
        params.require(:@event123).permit(:description)
    end

end
