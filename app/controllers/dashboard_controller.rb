class DashboardController < ApplicationController
  def index
    @events = Event.incoming
  end
end
