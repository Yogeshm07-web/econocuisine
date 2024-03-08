# Delete all records in the basket_items table
BasketItem.destroy_all

# Delete all records in the baskets table
Basket.destroy_all

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
  {
    name: 'Canned Tomatoes',
    description: 'Whole canned tomatoes, great for making sauces, soups, and stews.',
    category: Category.find_by(name: 'Canned Goods'),
    price: 75, # Mauritian Rupees
    stock: 100,
    quantity_unit: 'per can'
  },
   # Product 11
{
  name: 'Pasta',
  description: 'Various shapes of pasta, perfect for creating delicious Italian dishes.',
  category: Category.find_by(name: 'Grains & Pasta'),
  price: 80,
  stock: 80,
  quantity_unit: 'per kg'
},

# Product 12
{
  name: 'Olive Oil',
  description: 'High-quality olive oil, ideal for cooking, salad dressings, and dipping.',
  category: Category.find_by(name: 'Cooking Oils'),
  price: 300,
  stock: 60,
  quantity_unit: 'per liter'
},

# Product 13
{
  name: 'Apple',
  description: 'Crisp and juicy apples, perfect for snacking or adding to salads and desserts.',
  category: Category.find_by(name: 'Produce'),
  price: 50,
  stock: 120,
  quantity_unit: 'per kg'
},

# Product 14
{
  name: 'Orange Juice',
  description: 'Freshly squeezed orange juice, packed with vitamins and great for breakfast or as a refreshing drink.',
  category: Category.find_by(name: 'Beverages'),
  price: 90,
  stock: 40,
  quantity_unit: 'per liter'
},

# Product 15
{
  name: 'Chocolate Chips',
  description: 'Rich and creamy chocolate chips, perfect for adding to cookies, cakes, and other baked goods.',
  category: Category.find_by(name: 'Baking Supplies'),
  price: 120,
  stock: 70,
  quantity_unit: 'per kg'
},

# Product 16
{
  name: 'Ground Beef',
  description: 'Premium quality ground beef, versatile and great for making burgers, meatballs, and more.',
  category: Category.find_by(name: 'Meat'),
  price: 220,
  stock: 90,
  quantity_unit: 'per kg'
},

# Product 17
{
  name: 'Potato',
  description: 'Fresh potatoes, ideal for boiling, baking, frying, or mashing.',
  category: Category.find_by(name: 'Produce'),
  price: 40,
  stock: 150,
  quantity_unit: 'per kg'
},

# Product 18
{
  name: 'White Bread',
  description: 'Soft and fluffy white bread, perfect for sandwiches or toast.',
  category: Category.find_by(name: 'Bread & Bakery'),
  price: 30,
  stock: 100,
  quantity_unit: 'per loaf'
},

# Product 19
{
  name: 'Honey',
  description: 'Pure honey, naturally sweet and great for sweetening beverages, desserts, and snacks.',
  category: Category.find_by(name: 'Sweets & Spreads'),
  price: 180,
  stock: 50,
  quantity_unit: 'per kg'
},

# Product 20
{
  name: 'Lemon',
  description: 'Fresh and tangy lemons, perfect for adding zest to dishes or making lemonade.',
  category: Category.find_by(name: 'Produce'),
  price: 60,
  stock: 80,
  quantity_unit: 'per kg'
},

# Product 21
{
  name: 'Yogurt',
  description: 'Creamy yogurt, available in various flavors and perfect for breakfast or as a snack.',
  category: Category.find_by(name: 'Dairy'),
  price: 50,
  stock: 120,
  quantity_unit: 'per kg'
},

# Product 22
{
  name: 'Almonds',
  description: 'Whole almonds, packed with protein and essential nutrients, great for snacking or adding to recipes.',
  category: Category.find_by(name: 'Nuts & Seeds'),
  price: 250,
  stock: 70,
  quantity_unit: 'per kg'
},

# Product 23
{
  name: 'Salmon Fillet',
  description: 'Fresh salmon fillet, rich in omega-3 fatty acids and perfect for grilling, baking, or pan-searing.',
  category: Category.find_by(name: 'Seafood'),
  price: 400,
  stock: 60,
  quantity_unit: 'per kg'
},

# Product 24
{
  name: 'Black Beans',
  description: 'Dried black beans, rich in protein and fiber, perfect for soups, stews, and salads.',
  category: Category.find_by(name: 'Legumes'),
  price: 70,
  stock: 100,
  quantity_unit: 'per kg'
},

# Product 25
{
  name: 'Corn Tortillas',
  description: 'Authentic corn tortillas, perfect for tacos, enchiladas, and other Mexican dishes.',
  category: Category.find_by(name: 'Grains & Pasta'),
  price: 40,
  stock: 120,
  quantity_unit: 'per dozen'
},

# Product 26
{
  name: 'Green Tea',
  description: 'Premium green tea leaves, rich in antioxidants and perfect for a calming and refreshing beverage.',
  category: Category.find_by(name: 'Tea & Coffee'),
  price: 120,
  stock: 80,
  quantity_unit: 'per kg'
},

# Product 27
{
  name: 'Cucumber',
  description: 'Fresh cucumbers, crisp and refreshing, perfect for salads, sandwiches, or as a snack.',
  category: Category.find_by(name: 'Produce'),
  price: 30,
  stock: 150,
  quantity_unit: 'per kg'
},

# Product 28
{
  name: 'Peanut Butter',
  description: 'Smooth and creamy peanut butter, great for spreading on toast, sandwiches, or adding to recipes.',
  category: Category.find_by(name: 'Sweets & Spreads'),
  price: 100,
  stock: 90,
  quantity_unit: 'per jar'
},

# Product 29
{
  name: 'Cheddar Cheese',
  description: 'Sharp and flavorful cheddar cheese, great for snacking, sandwiches, or melting over dishes.',
  category: Category.find_by(name: 'Dairy'),
  price: 200,
  stock: 80,
  quantity_unit: 'per kg'
},

# Product 30
{
  name: 'Black Tea',
  description: 'Traditional black tea leaves, rich and robust in flavor, perfect for a comforting and energizing beverage.',
  category: Category.find_by(name: 'Tea & Coffee'),
  price: 80,
  stock: 100,
  quantity_unit: 'per kg'
},

# Product 31
{
  name: 'Canned Tuna',
  description: 'Flaky canned tuna, packed in water or oil, perfect for sandwiches, salads, or pasta dishes.',
  category: Category.find_by(name: 'Canned Goods'),
  price: 60,
  stock: 120,
  quantity_unit: 'per can'
},

# Product 32
{
  name: 'Raisins',
  description: 'Sweet and chewy raisins, perfect for snacking, baking, or adding to trail mix and oatmeal.',
  category: Category.find_by(name: 'Dried Fruits'),
  price: 50,
  stock: 150,
  quantity_unit: 'per kg'
},

# Product 33
{
  name: 'Mozzarella Cheese',
  description: 'Soft and mild mozzarella cheese, perfect for pizzas, pastas, or caprese salads.',
  category: Category.find_by(name: 'Dairy'),
  price: 180,
  stock: 70,
  quantity_unit: 'per kg'
},

# Product 34
{
  name: 'Hamburger Buns',
  description: 'Soft and fluffy hamburger buns, perfect for serving with burgers or sandwiches.',
  category: Category.find_by(name: 'Bread & Bakery'),
  price: 40,
  stock: 100,
  quantity_unit: 'per dozen'
},

# Product 35
{
  name: 'Maple Syrup',
  description: 'Pure maple syrup, rich in flavor and perfect for drizzling over pancakes, waffles, or oatmeal.',
  category: Category.find_by(name: 'Sweets & Spreads'),
  price: 250,
  stock: 60,
  quantity_unit: 'per liter'
},

# Product 36
{
  name: 'Lettuce',
  description: 'Crisp and refreshing lettuce leaves, perfect for salads, sandwiches, or lettuce wraps.',
  category: Category.find_by(name: 'Produce'),
  price: 20,
  stock: 200,
  quantity_unit: 'per kg'
},

# Product 37
{
  name: 'Milk Chocolate',
  description: 'Creamy milk chocolate, perfect for snacking or melting into hot chocolate.',
  category: Category.find_by(name: 'Sweets & Spreads'),
  price: 120,
  stock: 80,
  quantity_unit: 'per kg'
},

# Product 38
{
  name: 'Green Beans',
  description: 'Fresh green beans, crisp and flavorful, perfect for steaming, sautéing, or stir-frying.',
  category: Category.find_by(name: 'Produce'),
  price: 70,
  stock: 100,
  quantity_unit: 'per kg'
},

# Product 39
{
  name: 'White Rice',
  description: 'Basic white rice, versatile and perfect for serving with a wide variety of dishes.',
  category: Category.find_by(name: 'Grains & Pasta'),
  price: 50,
  stock: 150,
  quantity_unit: 'per kg'
},

# Product 40
{
  name: 'Vanilla Extract',
  description: 'Pure vanilla extract, adds a rich and aromatic flavor to baked goods, desserts, and beverages.',
  category: Category.find_by(name: 'Baking Supplies'),
  price: 200,
  stock: 60,
  quantity_unit: 'per liter'
},

# Product 41
{
  name: 'Pineapple',
  description: 'Sweet and tropical pineapple, perfect for snacking, adding to fruit salads, or grilling.',
  category: Category.find_by(name: 'Produce'),
  price: 100,
  stock: 70,
  quantity_unit: 'per piece'
},

# Product 42
{
  name: 'Red Wine Vinegar',
  description: 'Tangy red wine vinegar, perfect for salad dressings, marinades, or deglazing pans.',
  category: Category.find_by(name: 'Sauces & Condiments'),
  price: 80,
  stock: 80,
  quantity_unit: 'per liter'
},

# Product 43
{
  name: 'Cottage Cheese',
  description: 'Creamy cottage cheese, low in fat and high in protein, perfect for snacking or adding to salads.',
  category: Category.find_by(name: 'Dairy'),
  price: 90,
  stock: 100,
  quantity_unit: 'per kg'
},

# Product 44
{
  name: 'Red Bell Pepper',
  description: 'Sweet and crunchy red bell peppers, perfect for salads, stir-fries, or roasting.',
  category: Category.find_by(name: 'Produce'),
  price: 60,
  stock: 120,
  quantity_unit: 'per kg'
},

# Product 45
{
  name: 'Peanuts',
  description: 'Roasted peanuts, packed with protein and perfect for snacking or adding to trail mix.',
  category: Category.find_by(name: 'Nuts & Seeds'),
  price: 120,
  stock: 90,
  quantity_unit: 'per kg'
},

# Product 46
{
  name: 'Coconut Milk',
  description: 'Rich and creamy coconut milk, perfect for curries, soups, and smoothies.',
  category: Category.find_by(name: 'Canned Goods'),
  price: 70,
  stock: 100,
  quantity_unit: 'per can'
},

# Product 47
{
  name: 'Hummus',
  description: 'Creamy and flavorful hummus, perfect for dipping vegetables, pita chips, or spreading on sandwiches.',
  category: Category.find_by(name: 'Sweets & Spreads'),
  price: 80,
  stock: 80,
  quantity_unit: 'per jar'
},

# Product 48
{
  name: 'Quinoa',
  description: 'Nutritious quinoa, high in protein and perfect for salads, pilafs, or as a rice substitute.',
  category: Category.find_by(name: 'Grains & Pasta'),
  price: 150,
  stock: 70,
  quantity_unit: 'per kg'
},

# Product 49
{
  name: 'Ground Turkey',
  description: 'Lean ground turkey, versatile and perfect for making burgers, meatballs, or tacos.',
  category: Category.find_by(name: 'Meat'),
  price: 180,
  stock: 90,
  quantity_unit: 'per kg'
},

# Product 50
{
  name: 'Tofu',
  description: 'Versatile tofu, perfect for stir-fries, soups, salads, or as a meat substitute in various dishes.',
  category: Category.find_by(name: 'Protein Alternatives'),
  price: 100,
  stock: 120,
  quantity_unit: 'per kg'
}
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
