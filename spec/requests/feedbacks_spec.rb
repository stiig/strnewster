# frozen_string_literal: true

describe 'Feedbacks' do
  describe 'GET /feedback/new' do
    it 'open new feedback page' do
      get new_feedback_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /feedback' do
    context 'with valid params' do
      it 'create a new feedback' do
        post feedbacks_path, params: { feedback: attributes_for(:feedback) }
        follow_redirect!
        expect(response.body).to match(/alert alert-success/)
      end
    end

    context 'with invalid params' do
      it "re-renders the 'new' template" do
        post feedbacks_path, params: { feedback: { invalid: :data } }
        expect(response).not_to redirect_to(root_path)
        expect(response.body).to match(/error_explanation/)
        expect(response.body).to match(/Исправьте следующие ошибки перед сохранением:/)
      end
    end
  end
end
