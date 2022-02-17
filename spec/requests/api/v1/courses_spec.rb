require 'swagger_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'api/v1/courses', type: :request do
  let(:user) { create(:user) }
  let(:Authorization) { "Bearer #{JWT.encode({ user_id: user[:id] }, 'HaNJLisLook1ng')}" }
  let(:course) { create(:course, user_id: user[:id]) }
  let(:course1) { create(:course, title: 'boo', user_id: user[:id]) }

  path '/api/v1/courses' do
    get('list courses') do
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create course') do
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          course: {
            type: :object,
            properties: {
              title: { type: :string },
              type: { type: :string },
              image: { type: :string },
              user_id: { type: :string }
            },
            required: %w[title type image user_id]
          },
          description: {
            type: :object,
            properties: {
              price_daily: { type: :string },
              price_monthly: { type: :string },
              short_description: { type: :string }
            },
            required: %w[price_daily price_monthly short_description:]
          }
        },
        required: %w[course description]
      }

      response(201, 'successful') do
        let(:data) do
          {
            course: { title: 'smth', type: 'smth', image: 'smth', user_id: user[:id] },
            description: { price_daily: '10', price_monthly: '300', short_description: '#000' }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { 'blablubasdjasdsa ' }
        let(:data) do
          {
            course: { title: 'smth', type: 'smth', image: 'smth', user_id: user[:id] },
            description: { price_daily: '10', price_monthly: '300', short_description: '#000' }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/courses/{id}' do
    get('show course') do
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        let(:id) { course[:id] }

        run_test!
      end
    end

    delete('delete course') do
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        let(:id) { course[:id] }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
