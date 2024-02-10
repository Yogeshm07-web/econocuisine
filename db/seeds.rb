# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed Users
puts 'Seeding Users...'
admin_attributes = {
  email: 'admin@example.com',
  password: 'password',
  admin: true,
  first_name: 'Admin'
}
User.find_or_initialize_by(email: admin_attributes[:email]).update(admin_attributes)

puts 'Users seeded successfully!'

# Seed Products
puts 'Seeding Products...'
Product.create!(
  name: 'Whole Milk',
  description: 'Rich and creamy whole milk, perfect for drinking, cooking, and baking.',
  category: 'Dairy',
  price: 125, # Assuming price is in cents (integer)
  stock: 50
)

Product.create!(
  name: 'Butter',
  description: 'Premium quality butter, ideal for spreading on toast or using in recipes for a rich, buttery flavor.',
  category: 'Dairy',
  price: 200,
  stock: 100
)

Product.create!(
  name: 'All-Purpose Flour',
  description: 'Versatile all-purpose flour, essential for baking a wide variety of recipes, from bread to cakes.',
  category: 'Baking Supplies',
  price: 150,
  stock: 75
)

Product.create!(
  name: 'Granulated Sugar',
  description: 'Pure granulated sugar, perfect for sweetening beverages, desserts, and baked goods.',
  category: 'Baking Supplies',
  price: 100,
  stock: 100
)

Product.create!(
  name: 'Eggs',
  description: 'Fresh eggs from pasture-raised hens, ideal for breakfast, baking, and cooking.',
  category: 'Dairy',
  price: 175,
  stock: 50
)

Product.create!(
  name: 'Boneless Chicken Breast',
  description: 'Tender and juicy boneless chicken breast, great for grilling, baking, or sautéing.',
  category: 'Meat',
  price: 300,
  stock: 75
)

Product.create!(
  name: 'Fresh Spinach',
  description: 'Organic fresh spinach leaves, packed with nutrients and perfect for salads, smoothies, or sautéing.',
  category: 'Produce',
  price: 150,
  stock: 50
)

Product.create!(
  name: 'Basmati Rice',
  description: 'High-quality basmati rice, known for its fragrant aroma and fluffy texture when cooked.',
  category: 'Grains & Pasta',
  price: 250,
  stock: 100
)

Product.create!(
  name: 'Extra Virgin Olive Oil',
  description: 'Premium extra virgin olive oil, perfect for salad dressings, marinades, and cooking.',
  category: 'Condiments',
  price: 500,
  stock: 50
)

Product.create!(
  name: 'Canned Tomatoes',
  description: 'Whole canned tomatoes, great for making sauces, soups, and stews.',
  category: 'Canned Goods',
  price: 75,
  stock: 100
)

puts 'Products seeded successfully!'
