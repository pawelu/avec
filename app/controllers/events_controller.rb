class EventsController < ApplicationController
  before_action :set_event

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
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

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: 'Yupi!' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end



  private
    def set_event
      @event = Event.new
      @event = @current_user.events.find(params[:id]) if params[:id]
    end

    def event_params
      params.require(:event).permit(:title, :content, :date_start, :date_end)
    end
end
