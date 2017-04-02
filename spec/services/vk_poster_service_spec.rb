# frozen_string_literal: true

describe VkPosterService do
  subject { described_class }
  let(:valid_post) { create(:post) }
  let(:vk_poster_service) { subject.new(valid_post) }

  describe '.new' do
    it 'can create an instance' do
      expect(vk_poster_service).to be
    end
    it { expect(subject).to respond_to(:new).with(1).argument }
  end

  describe '.call' do
    it { expect(vk_poster_service).to respond_to(:call).with(0).arguments }
  end
end
