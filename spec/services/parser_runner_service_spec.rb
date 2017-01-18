# frozen_string_literal: true
describe ParserRunnerService do
  subject { described_class.new }
  let(:feed_source) { create(:feed_source, active: true) }

  context '#parse_data' do
    context 'should write in log when' do
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
  end
end
