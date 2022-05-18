require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "POST /events" do
    context 'unauthorized' do
      it "should 401 if not authorized" do
        post '/events'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  
    context 'authorized' do
      let!(:access_token) { FactoryBot.create(:access_token) }
      let(:json_body) { '{"event":{"customer_id":"5","event_code":"5","event_id":"7","timestamp":"2022-05-18 13:13:40 +0300","property_attributes":{"custom_property":"foobar","other_property":"foobar"}}}' }
  
      it "returns http created when authorized" do
        post "/events", params: JSON.parse(json_body), headers: {Authorization: 'Token ' + access_token.client_token, ClientId: access_token.access_id }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
