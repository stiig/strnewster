# frozen_string_literal: true

describe 'Feedbacks' do
  describe 'GET /feedback/new' do
    it 'open new feedback page' do
      get new_feedback_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /feedback' do
    it 'create new feedback' do
      post feedbacks_path, params: { feedback: attributes_for(:feedback) }
      follow_redirect!
      expect(response.body).to match(/alert alert-success/)
    end
  end
end
