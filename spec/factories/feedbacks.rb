# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    contact { Faker::Name.name }
    message { Faker::Lorem.paragraph }
  end
end
