# frozen_string_literal: true

FactoryGirl.define do
  factory :feedback do
    contact { Faker::Name.name }
    message { Faker::Lorem.paragraph }
  end
end
