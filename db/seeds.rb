# Delete all records in the basket_items table
BasketItem.destroy_all

# Delete all records in the baskets table
Basket.destroy_all
User.destroy_all


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
categories = categories = ['Dairy', 'Baking Supplies', 'Meat', 'Produce', 'Grains & Pasta', 'Canned Goods', 'Sauces & Condiments', 'Cooking Oils', 'Beverages', 'Nuts & Seeds', 'Seafood', 'Legumes', 'Bread & Bakery', 'Sweets & Spreads', 'Tea & Coffee', 'Dried Fruits', 'Protein Alternatives']

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

products = [
  {
    name: 'Whole Milk',
    description: 'Rich and creamy whole milk, perfect for drinking, cooking, and baking.',
    category: Category.find_by(name: 'Dairy'),
    price: 125, # Mauritian Rupees
    stock: 50,
    quantity_unit: 'per liter'
  },
  {
    name: 'Butter',
    description: 'Premium quality butter, ideal for spreading on toast or using in recipes for a rich, buttery flavor.',
    category: Category.find_by(name: 'Dairy'),
    price: 200, # Mauritian Rupees
    stock: 100,
    quantity_unit: 'per kg'
  },
  {
    name: 'All-Purpose Flour',
    description: 'Versatile all-purpose flour, essential for baking a wide variety of recipes, from bread to cakes.',
    category: Category.find_by(name: 'Baking Supplies'),
    price: 150, # Mauritian Rupees
    stock: 75,
    quantity_unit: 'per kg'
  },
  {
    name: 'Granulated Sugar',
    description: 'Pure granulated sugar, perfect for sweetening beverages, desserts, and baked goods.',
    category: Category.find_by(name: 'Baking Supplies'),
    price: 100, # Mauritian Rupees
    stock: 100,
    quantity_unit: 'per kg'
  },
  {
    name: 'Eggs',
    description: 'Fresh eggs from pasture-raised hens, ideal for breakfast, baking, and cooking.',
    category: Category.find_by(name: 'Dairy'),
    price: 175, # Mauritian Rupees
    stock: 50,
    quantity_unit: 'per dozen'
  },
  {
    name: 'Boneless Chicken Breast',
    description: 'Tender and juicy boneless chicken breast, great for grilling, baking, or sautéing.',
    category: Category.find_by(name: 'Meat'),
    price: 300, # Mauritian Rupees
    stock: 75,
    quantity_unit: 'per kg'
  },
  {
    name: 'Fresh Spinach',
    description: 'Organic fresh spinach leaves, packed with nutrients and perfect for salads, smoothies, or sautéing.',
    category: Category.find_by(name: 'Produce'),
    price: 150, # Mauritian Rupees
    stock: 50,
    quantity_unit: 'per kg'
  },
  {
    name: 'Basmati Rice',
    description: 'High-quality basmati rice, known for its fragrant aroma and fluffy texture when cooked.',
    category: Category.find_by(name: 'Grains & Pasta'),
    price: 250, # Mauritian Rupees
    stock: 100,
    quantity_unit: 'per kg'
  },
  {
    name: 'Soy Sauce',
    description: 'Traditional soy sauce, perfect for seasoning and enhancing the flavor of various dishes.',
    category: Category.find_by(name: 'Sauces & Condiments'),
    price: 100, # Mauritian Rupees
    stock: 75,
    quantity_unit: 'per liter'
  },
  # Add more product entries here...
]

products.each do |product_attrs|
  category = product_attrs[:category]
  if category.nil?
    puts "Category not found for product: #{product_attrs[:name]}"
  else
    Product.find_or_create_by!(product_attrs)
  end
end

puts 'Products seeded successfully!'