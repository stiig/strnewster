# frozen_string_literal: true

module ParserRunnerService
  module_function

  def parse_data
    with_log do |logger|
      # TODO: will try parse in threads
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

        handle_parsed_elements(parsed_elements, element, logger)
      end
    end
  end

  private_class_method def with_log
    logger = Rails.logger
    logger.info 'ParserRunnerService start'
    yield logger
    logger.info 'ParserRunnerService finish'
  end

  private_class_method def handle_parsed_elements(elements, parent_source, logger)
    if elements.blank?
      logger.warn "#{parent_source.title}: #{parent_source.url} empty answer"
    else
      elements.each do |obj|
        parsed_item = obj.to_h.merge(feed_source: parent_source)
        ParsedArticle.find_or_create_by(parsed_item)
      end
    end
  end
end
