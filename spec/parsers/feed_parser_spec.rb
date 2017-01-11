# frozen_string_literal: true
describe FeedParser do
  before(:each) do
    stub_request(:get, 'http://example.com/rss').
      with(headers: { Accept: '*/*', 'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent': 'Ruby' }).
      to_return(status: 200, body: '', headers: {})
  end

  context '#perform' do
    it 'should return nil if body is empty' do
      expect(described_class.new('http://example.com/rss').perform).to be nil
    end
  end
end
