# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create Product Types
ProductType.destroy_all
prod_types = ProductType.create(
  [
    { name: 'General Books', location: 'Sector 1', checkout_days: 7, late_fee: 1.25 },
    { name: 'Children Books', location: 'Sector 2', checkout_days: 14, late_fee: 1.25 },
    { name: 'Reference Books', location: 'Sector 3' },
    { name: 'CDs / DVDs', location: 'Sector 4', checkout_days: 3, late_fee: 2.5 },
  ]
)
puts "#{prod_types.count} product_types seeded"

# Create Products
Product.destroy_all
products = []
20.times do
  products << Product.create(
    {
      name: Faker::Book.title,
      author: Faker::Book.author,
      publisher: Faker::Book.publisher,
      genre: Faker::Book.genre,
      published_date: Time.now - rand(3650).days,
      product_type: prod_types.sample
    }
  )
end
puts "#{products.count} products seeded"

# Create Customers
Customer.destroy_all
customers = []
10.times do
  customers << Customer.create(
    {
      name: Faker::StarTrek.character,
      email: Faker::Internet.email,
      address: "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.state_abbr}"
    }
  )
end
puts "#{customers.count} products seeded"

# Create Checkouts
products[0..15].each do |prod|
  if prod.in_library
    pickup_date = Time.now - (rand(15) + 1).days
    Checkout.create(
      {
        customer: customers.sample,
        product: prod,
        pickup_date: pickup_date
      }
    )
    prod.in_library = false
    prod.updated_at = pickup_date
    prod.save
  end
end

# Create Returns
Product.all[0..3].each do |prod|
  if !prod.in_library
    chkout = prod.checkouts.last
    chkout.dropoff_date = Time.now
    chkout.updated_at = Time.now
    chkout.save
    prod.in_library = true
    prod.save
  end
end
