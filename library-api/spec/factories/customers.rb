FactoryBot.define do
  factory :customer do
    name { Faker::StarTrek.character }
    email { Faker::Internet.email }
    address { "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.state_abbr}" }
  end
end
