# frozen_string_literal: true

describe FeedbacksController do
  let(:valid_attributes) { attributes_for(:feedback) }
  let(:invalid_attributes) { { invalid: :data } }

  describe 'GET #new' do
    it 'should return success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Feedback' do
        expect do
          post :create, params: { feedback: valid_attributes }
        end.to change(Feedback, :count).by(1)
        expect(flash[:success]).to be_present
      end

      it 'should return redirect http status' do
        post :create, params: { feedback: valid_attributes }
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to the root path' do
        post :create, params: { feedback: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it "re-renders the 'new' template" do
        post :create, params: { feedback: invalid_attributes }
        expect(response).not_to redirect_to(root_path)
      end
    end
  end
end
