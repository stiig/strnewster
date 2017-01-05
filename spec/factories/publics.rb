# frozen_string_literal: true
FactoryGirl.define do
  factory :public do
    title { Faker::Lorem.word }
    outer_id { Faker::Number.between(100_000, 99_999_999) }
    width { Faker::Number.between(200, 800) }
    height { Faker::Number.between(200, 800) }
    mode { Faker::Number.between(0, 4) }
    wide { Faker::Number.between(0, 1) }
  end
end
