class DashboardController < ApplicationController
  def index
    @incoming_events = Event.incoming
    @past_events = Event.past
  end
end
