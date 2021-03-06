# frozen_string_literal: true

describe MainController do
  describe 'GET #index' do
    it 'returns http success without parsed_articles' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
