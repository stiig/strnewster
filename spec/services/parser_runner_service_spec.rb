# frozen_string_literal: true
describe ParserRunnerService do
  url = 'http://example.com/rss'
  subject { described_class }
  let(:feed_source) { create(:feed_source, active: true, url: url) }

  context '::parse_data' do
    context 'when something went wrong should write in log when' do
      before :each do
        stub_request(:get, feed_source.url)
      end

      it('body is empty') { subject.parse_data }

      it 'network time-out' do
        stub_request(:get, feed_source.url).to_timeout
        subject.parse_data
      end

      it 'url is wrong' do
        stub_request(:get, feed_source.url).to_raise(SocketError)
        subject.parse_data
      end
    end

    context 'when url is right' do
      include_context 'shared rss and atom', uri: url

      it 'should return fill ParsedArticle model if body is atom' do
        stub_request(:get, feed_source.url).to_return(body: atom_body.to_s)
        expect(ParsedArticle.all.size).to eq 0
        subject.parse_data
        expect(ParsedArticle.all.size).to eq 1
      end

      it 'should return fill ParsedArticle model if body is rss' do
        stub_request(:get, feed_source.url).to_return(body: rss_body.to_s)
        expect(ParsedArticle.all.size).to eq 0
        subject.parse_data
        expect(ParsedArticle.all.size).to eq 1
      end
    end
  end
end
