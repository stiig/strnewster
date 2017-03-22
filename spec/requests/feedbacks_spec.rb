# frozen_string_literal: true

describe 'Feedbacks' do
  describe 'GET /feedbacks' do
    it 'works! (now write some real specs)' do
      get new_feedback_path
      expect(response).to have_http_status(200)
    end
  end
end
