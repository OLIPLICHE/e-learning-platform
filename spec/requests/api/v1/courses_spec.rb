require 'swagger_helper'
RSpec.describe 'api/v1/courses', type: :request do
  # rubocop: disable Metrics
  path '/api/v1/courses' do
    get('list courses') do
      tags 'Courses'
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
      tags 'Courses'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :course, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          city: { type: :string },
          price: { type: :integer },
          country: { type: :string },
          level: { type: :string },
          picture: { type: :string }
        },
        required: %w[title city price country level picture]
      }

      response '201', 'course created' do
        let(:course) do
          { title: 'rails', city: 'yakro', price: 100, country: 'france', level: 'Beginner', picture: 'image.jpg' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:course) { { title: 'rails', city: 'yakro', price: 100, level: 'Beginner', picture: 'image.jpg' } }
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
      security [bearer_auth: []]
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
      response '201', 'successfully authenticated' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end

    delete('delete course') do
      tags 'Courses'
      security [bearer_auth: []]
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
  # rubocop: enable Metrics
end