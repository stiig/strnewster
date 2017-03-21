# frozen_string_literal: true

describe Feedback do
  subject { create(:feedback) }

  describe 'attributes' do
    context 'message' do
      it('should be presense') { is_expected.to validate_presence_of(:message) }
    end
  end
end
