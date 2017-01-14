# frozen_string_literal: true
describe FeedParser do
  let(:uri) { 'http://example.com/rss' }

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
      let(:time_now) { Time.now.utc }

      let(:atom_body) do
        RSS::Maker.make('atom') do |maker|
          maker.channel.author = 'Someone'
          maker.channel.updated = time_now
          maker.channel.about = uri
          maker.channel.title = 'Example Feed'

          maker.items.new_item do |item|
            item.link = "#{uri}/example"
            item.title = 'Ruby 1.9.2-p136 is released'
            item.published = time_now
            item.updated = time_now
          end
        end
      end

      let(:rss_body) do
        RSS::Maker.make('2.0') do |maker|
          maker.channel.author = 'Someone'
          maker.channel.updated = time_now
          maker.channel.link = uri
          maker.channel.description = 'Some description'
          maker.channel.title = 'Example Feed'

          maker.items.new_item do |item|
            item.link = "#{uri}/example"
            item.title = 'Ruby 1.9.2-p136 is released'
            item.pubDate = time_now
            item.updated = time_now
          end
        end
      end

      it 'should return array of hashes when atom body' do
        stub_request(:get, uri).to_return(body: atom_body.to_s)

        expect(described_class.new(uri).perform).to be_a Array
        expect(described_class.new(uri).perform).to include(be_a(Hash))
      end

      it 'should return array of hashes when rss body' do
        stub_request(:get, uri).to_return(body: rss_body.to_s)

        expect(described_class.new(uri).perform).to be_a Array
        expect(described_class.new(uri).perform).to include(be_a(Hash))
      end

      context 'when answer is exist' do
        before do
          stub_request(:get, uri).to_return(body: rss_body.to_s)
        end

        it 'inner hash should have right keys' do
          expect(described_class.new(uri).perform.first).to include(:date, :title, :link)
        end
      end
    end
  end
end
