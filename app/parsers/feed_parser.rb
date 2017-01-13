# frozen_string_literal: true
require 'rss'

class FeedParser
  def initialize(url)
    @url = url
  end

  def perform
    perform_request { |doc| @parsed_feed = RSS::Parser.parse(doc, false) }
    item_container if @parsed_feed
  end

  private

  def perform_request
    old_def_encoding = Encoding.default_internal
    Encoding.default_internal = nil
    doc = open(@url, read_timeout: 5, open_timeout: 3).read
    yield doc
    Encoding.default_internal = old_def_encoding
  end

  def item_container
    case @parsed_feed.feed_type
    when 'atom'
      parse_atom(@parsed_feed)
    when 'rss'
      parse_rss(@parsed_feed)
    end
  end

  def parse_atom(feed)
    feed.items.collect do |item|
      {
        date: Time.zone.parse(item.published.to_s),
        content: item.title.content,
        link: item.link.href
      }
    end
  end

  def parse_rss(feed)
    feed.items.collect do |item|
      {
        date: Time.zone.parse(item.pubDate.to_s),
        content: item.title,
        link: item.link
      }
    end
  end
end
