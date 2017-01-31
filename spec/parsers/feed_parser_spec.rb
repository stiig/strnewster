# frozen_string_literal: true

describe FeedParser do
  uri = 'http://example.com/rss'

  context '#perform' do
    it 'should return nil if body is empty' do
      stub_request(:get, uri)

      expect(described_class.new(uri).perform).to be nil
    end

    it 'should raise Net::OpenTimeout error if connection time out' do
      stub_request(:get, uri).to_timeout

      expect { described_class.new(uri).perform }.to raise_error Net::OpenTimeout
    end

    it 'should return nil if responce invalid' do
      stub_request(:get, uri).to_return(body: 'invalid body')

      expect(described_class.new(uri).perform).to be nil
    end

    context 'when rss link is right' do
      include_context 'shared rss and atom', uri: uri

      it 'should return array of hashes when atom body' do
        stub_request(:get, uri).to_return(body: atom_body.to_s)

        expect(described_class.new(uri).perform).to be_a Array
        expect(described_class.new(uri).perform).to include(be_a(described_class::ParsedItem))
      end

      it 'should return array of hashes when rss body' do
        stub_request(:get, uri).to_return(body: rss_body.to_s)

        expect(described_class.new(uri).perform).to be_a Array
        expect(described_class.new(uri).perform).to include(be_a(described_class::ParsedItem))
      end

      context 'when answer is exist' do
        before do
          stub_request(:get, uri).to_return(body: rss_body.to_s)
        end

        it 'inner hash should have right keys' do
          expect(described_class.new(uri).perform.first).to respond_to(:date, :title, :link)
        end
      end
    end
  end
end
