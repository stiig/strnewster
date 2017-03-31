# frozen_string_literal: true

describe VkPosterService do
  subject { described_class }
  let(:valid_post) { create(:post) }

  describe '.new' do
    context 'when post exists' do
      it 'can create an instance' do
        subject.new(valid_post)
      end
    end
  end
end
