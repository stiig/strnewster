# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    text { Faker::Lorem.paragraph }
    last_parsed_article_id { Faker::Number.number(3) }
  end
end
