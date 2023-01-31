require 'swagger_helper'

RSpec.describe 'api/v1/instruments', type: :request do
  # rubocop: disable Metrics
  path '/api/v1/instruments' do
    get('list instruments') do
      tags 'Instruments'
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

    post('create instrument') do
      security [bearer_auth: []]
      tags 'Instruments'
      consumes 'application/json'
      parameter name: :instrument, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          category: { type: :string },
          price: { type: :integer },
          image: { type: :string },
          description: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[name category price image description user_id]
      }

      response '201', 'instrument created' do
        let(:room) do
          { name: 'guitar', category: 'string', price: 100, description: 'a guitar', image: 'guitar pic.png', user_id: 2 }
        end
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
      response '422', 'invalid request' do
        let(:room) { { name: 'guitar', category: 'string', price: 100, description: 'a guitar', image: 'guitar pic.png' } }
        run_test!
      end
      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('admin@localhost')}" }
        run_test!
      end
    end
  end

  path '/api/v1/instruments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show instrument') do
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
    end

    delete('delete instrument') do
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

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{Base64.strict_encode64('admin@localhost')}" }
        run_test!
      end
    end
  end
  # rubocop: enable Metrics
end
