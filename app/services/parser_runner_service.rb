# frozen_string_literal: true
class ParserRunnerService
  def parse_data
    logger = Rails.logger
    logger.info 'ParserRunnerService start'
    FeedSource.activated.each do |element|
      parsed_elements = []
      begin
        logger.info "perform #{element.title}: #{element.url}"
        parsed_elements = FeedParser.new(element.url).perform
      rescue Net::OpenTimeout => e
        logger.warn "#{element.title} temporary not allowed by time-out. Details: #{e.message}"
      rescue SocketError => e
        logger.warn "#{element.title} temporary not allowed. Details: #{e.message}"
      end
      if parsed_elements.blank?
        logger.warn "#{element.title}: #{element.url} empty answer"
      else
        parsed_elements.each do |obj|
          parsed_item = obj.to_h.merge(feed_source: element)
          el = ParsedArticle.find_or_create_by(parsed_item)
          el.update(parsed_item) if obj.date > el.date
        end
      end
    end
    logger.info 'ParserRunnerService finish'
  end
end