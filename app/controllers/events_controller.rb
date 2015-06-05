class EventsController < ApplicationController
  def show
    @events = @registered_application.events
    @event = @registered_application.events.find(params[:id])
  end
end