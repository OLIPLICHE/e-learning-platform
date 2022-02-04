require 'swagger_helper'

RSpec.describe 'api/v1/courses', type: :request do
  path '/api/v1/courses' do
    get('list courses') do
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

      response '201', 'Authorized' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end

    post 'create course' do
      tags 'courses'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :course, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          city: { type: :string },
          price: { type: :integer },
          level: { type: :string },
          country: { type: :string },
          picture: { type: :string }
        },
        required: %w[title city price level country picture]
      }

      response '201', 'course created' do
        let(:course) do
          { name: 'foo', city: 'rio', price: 23, level: 'basic', country: 'In-course games', picture: 'image.jpg' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:course) { { name: 'foo', city: 'rio', price: 23, country: 'In-course games', picture: 'image.jpg' } }
        run_test!
      end

      response '201', 'successfully authenticated' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end

      response(201, 'successful') do
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

  path '/api/v1/courses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show course') do
      tags 'Courses'
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

    delete('delete course') do
      tags 'Courses'
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

      response '201', 'delete course' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end
end
