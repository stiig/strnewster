# frozen_string_literal: true
shared_context 'shared rss and atom', shared_context: :metadata do |**kwargs|
  let(:time_now) { Time.now.utc }
  let(:uri) { kwargs[:uri] || 'http://example.com/rss' }

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
end
