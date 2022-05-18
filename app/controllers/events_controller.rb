class EventsController < ApplicationController

  def create
    @event_creator = EventCreator.new(event_params).create_event

    render :json => @event_creator, :status => :created
  end

  private

  def event_params
    params.require(:event).permit(:event_id, :customer_id, :event_code, :timestamp, property_attributes: %i[id custom_property other_property]).to_h
  end
end
