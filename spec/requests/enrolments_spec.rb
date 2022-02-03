require 'rails_helper'

RSpec.describe 'Enrolments', type: :request do
  describe 'GET /enrolments' do
    it 'works! (now write some real specs)' do
      get enrolments_path
      expect(response).to have_http_status(200)
    end
  end
end
