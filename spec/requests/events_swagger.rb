require 'swagger_helper'

RSpec.describe 'events', type: :request do

  path '/events' do

    post('Create Event') do
      tags 'Events'
      consumes 'application/json'
      parameter name: :event, in: :body, schema: {
        type: :object,
        properties: {
          customer_id: { type: :string },
          event_code: { type: :string },
          event_id: { type: :string },
          timestamp: { type: :string },
          property_attributes: { 
            type: :object,
            properties: {
              custom_property: { type: :string },
              other_property: { type: :string }
            }
          }
        },
        required: [ 'event', 'customer_id', ]
      }

      response(201, 'created') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
