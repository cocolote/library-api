FactoryBot.define do
  factory :product do
    name { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
    genre { Faker::Book.genre }
    published_date { Time.now - rand(3650).days }
    product_type_id nil
  end
end

