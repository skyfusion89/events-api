class EventCreator
  def initialize(params)
    @params = params
  end

  def create_event
    store_event
  end

  def store_event
    event = Event.new(@params)
    event.save!
  end

  handle_asynchronously :store_event
end
