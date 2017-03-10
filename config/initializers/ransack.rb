# frozen_string_literal: true

Ransack.configure do |config|
  config.add_predicate 'gteq_datetime',
                       arel_predicate: 'gteq',
                       formatter: ->(v) { v.beginning_of_day }

  config.add_predicate 'lteq_datetime',
                       arel_predicate: 'lt',
                       formatter: ->(v) { v + 1.day }
end
