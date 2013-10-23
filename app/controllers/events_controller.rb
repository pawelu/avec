class EventsController < ApplicationController
  before_action :set_event

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.new(event_params)
    @event.user = @current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'New event was created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    def set_event
      @event = @current_user.events || Event.new
    end

    def event_params
      params.require(:event).permit(:title, :content, :date_start, :date_end)
    end
end
