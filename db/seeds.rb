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
  url: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi5.walmartimages.com%2Fseo%2FGreat-Value-Whole-Vitamin-D-Milk-Gallon-128-fl-oz_6a7b09b4-f51d-4bea-a01c-85767f1b481a.86876244397d83ce6cdedb030abe6e4a.jpeg%3FodnHeight%3D768%26odnWidth%3D768%26odnBg%3DFFFFFF&tbnid=WxSbilaKHxSIAM&vet=12ahUKEwjh_qzEhK6EAxUWVaQEHfiXAPcQMygBegQIARBw..i&imgrefurl=https%3A%2F%2Fwww.walmart.com%2Fip%2FGreat-Value-Whole-Vitamin-D-Milk-Gallon-128-fl-oz%2F10450114&docid=zQF1JQ8UWYHvsM&w=768&h=768&q=whole%20milk&ved=2ahUKEwjh_qzEhK6EAxUWVaQEHfiXAPcQMygBegQIARBw',
  category: 'Dairy',
  price: 125, # Assuming price is in cents (integer)
  stock: 50,
  quantity_unit: 'per liter' # Define the quantity unit here
)

Product.create!(
  name: 'Butter',
  description: 'Premium quality butter, ideal for spreading on toast or using in recipes for a rich, buttery flavor.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fkalonasupernatural.com%2Fproduct%2Forganic-milk-cream%2Forganic-cultured-buttermilk%2F&psig=AOvVaw1KWonIbM19oFZIVI8-rA8r&ust=1708110358574000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJD6nYuFroQDFQAAAAAdAAAAABAE',
  category: 'Dairy',
  price: 200,
  stock: 100,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'All-Purpose Flour',
  description: 'Versatile all-purpose flour, essential for baking a wide variety of recipes, from bread to cakes.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.unlockfood.ca%2Fen%2FArticles%2FCooking-And-Food%2FGrain-Products%2FAll-about-grain-flours.aspx&psig=AOvVaw3mtiCcUIHFNwsQjiWhceaN&ust=1708110539643000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMCb2eGFroQDFQAAAAAdAAAAABAE',
  category: 'Baking Supplies',
  price: 150,
  stock: 75,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'Granulated Sugar',
  description: 'Pure granulated sugar, perfect for sweetening beverages, desserts, and baked goods.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.axios.com%2F2023%2F07%2F24%2Fsugar-prices-shortage-halloween-candy&psig=AOvVaw3-HgIVTEAWGGrwcdjLKQiI&ust=1708110785105000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMii0taGroQDFQAAAAAdAAAAABAE',
  category: 'Baking Supplies',
  price: 100,
  stock: 100,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'Eggs',
  description: 'Fresh eggs from pasture-raised hens, ideal for breakfast, baking, and cooking.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.britannica.com%2Ftopic%2Fegg-food&psig=AOvVaw3o-DYVvxqxeSzyo4TUUilh&ust=1708110916522000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIj-spWHroQDFQAAAAAdAAAAABAE',
  category: 'Dairy',
  price: 175,
  stock: 50,
  quantity_unit: 'per dozen' # Define the quantity unit here
)

Product.create!(
  name: 'Boneless Chicken Breast',
  description: 'Tender and juicy boneless chicken breast, great for grilling, baking, or sautéing.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tyson.com%2Fproducts%2Ffresh-chicken-boneless-skinless-breast%2F&psig=AOvVaw1sn3UBAm7ahApJS3Nupin_&ust=1708111029111000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIDFk8uHroQDFQAAAAAdAAAAABAE',
  category: 'Meat',
  price: 300,
  stock: 75,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'Fresh Spinach',
  description: 'Organic fresh spinach leaves, packed with nutrients and perfect for salads, smoothies, or sautéing.',
  url:'https://images.immediate.co.uk/production/volatile/sites/30/2013/06/GettyImages-652986635-3dffa4d.jpg?quality=90&resize=556,505',
  category: 'Produce',
  price: 150,
  stock: 50,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'Basmati Rice',
  description: 'High-quality basmati rice, known for its fragrant aroma and fluffy texture when cooked.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsimplythegreat.com%2Fproducts%2Fbasmati-rice&psig=AOvVaw3BOKp2WzETZFU1QlmE4Meq&ust=1708110850594000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJCL8vWGroQDFQAAAAAdAAAAABAE',
  category: 'Grains & Pasta',
  price: 250,
  stock: 100,
  quantity_unit: 'per kg' # Define the quantity unit here
)

Product.create!(
  name: 'Extra Virgin Olive Oil',
  description: 'Premium extra virgin olive oil, perfect for salad dressings, marinades, and cooking.',
  url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fceres.co.nz%2Fproducts%2F10359-organic-olive-oil-extra-virgin-cold-pressed-500ml&psig=AOvVaw254iJwmv41Vitx738FQtxR&ust=1708110672220000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCOCs8aCGroQDFQAAAAAdAAAAABAE',
  category: 'Condiments',
  price: 500,
  stock: 50,
  quantity_unit: 'per liter' # Define the quantity unit here
)

Product.create!(
  name: 'Canned Tomatoes',
  description: 'Whole canned tomatoes, great for making sauces, soups, and stews.',
  url:'https://www.allrecipes.com/thmb/v7p4-wFK22zmUDJlktNwgslED-8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/ar-canned-tomato-taste-test-cento-whole-4x3-1b3a0d596e0041ffad3c644cb039b53a.jpg',
  category: 'Canned Goods',
  price: 75,
  stock: 100,
  quantity_unit: 'per can' # Define the quantity unit here
)

puts 'Products seeded successfully!'
