# frozen_string_literal: true

FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password '12345678'
  end
end
