# frozen_string_literal: true

describe VkPosterService do
  subject { described_class }
  let(:valid_post) { create(:post) }
  let(:vk_poster_service) { subject.new(valid_post) }

  describe '.new' do
    it { expect(subject).to respond_to(:new).with(1).argument }
    it 'can create an instance' do
      expect(vk_poster_service).to be
    end
  end

  describe '.call' do
    it { expect(vk_poster_service).to respond_to(:call).with(0).arguments }

    it 'publish post on the wall in Vk' do
      stub_request(:post, 'https://api.vk.com/method/wall.post')
        .with(headers: { Accept: '*/*',
                         'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                         'Content-Type': 'application/x-www-form-urlencoded' })
        .to_return(status: 200,
                   body: { response: { post_id: '1' } }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      stub_request(:post, 'https://api.vk.com/method/photos.getWallUploadServer')
        .with(headers: { Accept: '*/*',
                         'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                         'Content-Type': 'application/x-www-form-urlencoded' })
        .to_return(status: 200,
                   body: { response: { upload_url: 'https://api.vk.com/example' } }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      stub_request(:post, 'https://api.vk.com/example')
        .with(headers: { Accept: '*/*',
                         'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3' })
        .to_return(status: 200,
                   body: { response: { upload_url: 'https://api.vk.com/example' } }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      stub_request(:post, 'https://api.vk.com/method/photos.saveWallPhoto')
        .with(headers: { Accept: '*/*',
                         'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                         'Content-Type': 'application/x-www-form-urlencoded' })
        .to_return(status: 200,
                   body: { response: [{ id: 1 }] }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      expect { vk_poster_service.call }.to change(Post.published, :count)
    end

    it 'log error when something went wrong' do
      stub_request(:post, 'https://api.vk.com/method/wall.post')
        .to_return(status: 200,
                   body: { error: {} }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      stub_request(:post, 'https://api.vk.com/method/photos.getWallUploadServer')
        .to_return(status: 200,
                   body: { error: {} }.to_json,
                   headers: { 'Content-Type': 'application/json' })

      expect { vk_poster_service.call }.to output(/VK not available/).to_stderr
    end
  end
end
