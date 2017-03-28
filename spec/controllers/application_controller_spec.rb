# frozen_string_literal: true

describe ApplicationController do
  describe 'GET #error_404' do
    it 'return status not found' do
      change_all_requests_local(false) do
        get :error_404, params: { path: 'unknown_path' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
