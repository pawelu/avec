class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(datetime_start: Time.now)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    event = Event.new(event_params)
    event.user = current_user
    respond_to do |format|
      if event.save
        format.html { redirect_to root_path, notice: 'New event was created.' }
        format.json { render action: 'show', status: :created, location: event }
      else
        format.html { render action: 'new' }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    event = Event.find(params[:id])
    event.assign_attributes(event_params)
    respond_to do |format|
      if event.save
        format.html { redirect_to root_path, notice: 'Yupi!' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def past
    @events = Event.past

    render 'dashboard/index'
  end

  def participate
    event = Event.find(params[:id])
    event.participants.push(current_user)
    event.save!

    redirect_to root_path
  end

  def retreat
    event = Event.find(params[:id])
    event.participants.delete(current_user)
    event.save!

    redirect_to root_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :datetime_start, :capacity, :address)
    end
end
