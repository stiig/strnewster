# frozen_string_literal: true

describe ResourceController do
  let(:feed_source) { create(:feed_source) }
  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: feed_source.id }
      expect(response).to have_http_status(:success)
    end
  end
end
