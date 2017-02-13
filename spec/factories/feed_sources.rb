# frozen_string_literal: true

FactoryGirl.define do
  factory :feed_source do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    active { Faker::Boolean.boolean }
    source_url { Faker::Internet.url }
  end
end
