require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "Events Controller" do
    it "routes to #create" do
      expect(post: "/events").to route_to("events#create")
    end
  end
end