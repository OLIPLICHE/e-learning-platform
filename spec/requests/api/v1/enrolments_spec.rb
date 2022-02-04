require 'swagger_helper'

RSpec.describe 'api/v1/enrolments', type: :request do
  path '/api/v1/enrolments' do
    get('list enrolments') do
      tags 'Enrolments'
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
  end
end
