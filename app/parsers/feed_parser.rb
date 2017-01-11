# frozen_string_literal: true
require 'rss'

class FeedParser
  def initialize(url)
    @url = url
  end

  def perform
    doc = open(@url)
    @parse_page = RSS::Parser.parse(doc, false)
    item_container if @parse_page
  end

  private

  def item_container
    items = []
    @parse_page.items.each do |item|
      items << {
        date: Time.zone.parse(item.pubDate.to_s),
        content: item.title,
        link: item.link
      }
    end
    items
  end
end
