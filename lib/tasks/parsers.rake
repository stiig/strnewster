# frozen_string_literal: true

namespace :parsers do
  desc 'Run all parsers'
  task all: :environment do
    ParserRunnerService.parse_data
  end
end
