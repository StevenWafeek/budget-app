require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'User1', email: 'Test@mail.com', password: '123456') }
  let(:group) { user.groups.create(name: 'shopping', icon: 'img1.png') }

  before do
    sign_in user
  end

  describe 'GET /groups' do
    before { get groups_path }

    it 'responds with HTTP status :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds with HTML content type' do
      expect(response.content_type).to include('text/html')
    end
  end

  describe 'GET /groups/:id' do
    before { get group_path(group) }

    it 'responds with HTTP status :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds with HTML content type' do
      expect(response.content_type).to include('text/html')
    end

    it 'displays group name' do
      expect(response.body).to include('shopping')
    end
  end

  describe 'GET /groups/new' do
    before { get new_group_path }

    it 'responds with HTTP status :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds with HTML content type' do
      expect(response.content_type).to include('text/html')
    end

    it 'displays "Name" in the response body' do
      expect(response.body).to include('Name')
    end
  end
end
