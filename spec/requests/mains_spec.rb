# frozen_string_literal: true

describe 'Main page' do
  describe 'GET /' do
    it 'opens index page' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
