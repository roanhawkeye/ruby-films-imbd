# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { Faker::Job.position }
  end
end

FactoryBot.define do
  factory(:movie) do
    imdb_id { Faker::Internet.uuid }
    title { Faker::Movie.title }
    rating { Faker::Number.between(from: 0.0, to: 5.0) }
    rank { Faker::Number.number(digits: 2) }
    year { Faker::Number.between(from: 1980, to: 2022) }
    data { Faker::Json.shallow_json(width: 3, options: { key: 'Name.first_name', value: 'Name.last_name' }) }
  end
end

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "password"} 
    password_confirmation { "password" }
  end
end
