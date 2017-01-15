# frozen_string_literal: true
FactoryGirl.define do
  factory :parsed_article do
    title { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    date { Faker::Date.backward(10) }
    feed_source
  end
end
