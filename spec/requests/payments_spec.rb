require 'rails_helper'

RSpec.describe 'GroupTrack', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'User1', email: 'test@mail.com', password: '1234') }

  describe 'GET /new' do
    before do
      sign_in user
      get new_payment_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Amount')
    end
  end
end
