require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  # rubocop: disable Metrics
  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [bearer_auth: []]
      response(200, 'successful') do
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

    post('create reservation') do
      tags 'Reservations'
      security [bearer_auth: []]
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          pickup_date: { type: :date },
          return_date: { type: :date },
          instrument_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[pickup_date return_date instrument_id user_id]
      }
      response '201', 'reservation created' do
        let(:reservation) do
          { pickup_date: '2023-02-26', return_date: '2023-02-29', instrument_id: 1, user_id: 1 }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:reservation) { { pickup_date: '2023-02-26', return_date: '2023-02-29', instrument_id: 3 } }
        run_test!
      end
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '201', 'Authorized' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('admin@localhost')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '201', 'Authorized' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('admin@localhost')}" }
        run_test!
      end

      response '404', 'not found' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end
  # rubocop: enable Metrics
end
