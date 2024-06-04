require 'faker'
require_relative 'ar.rb'

# Loop to generate 10 new categories
10.times do
  # Create a new category using Faker
  category = Category.create(name: Faker::Commerce.department)

  # Ensure the category is saved before creating products
  if category.persisted?
    # Loop to generate 10 new products for each category
    10.times do
      product = category.products.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence,
        price: Faker::Commerce.price,
        stock_quantity: Faker::Number.between(1, 100) 
      )

      # Print the product details to ensure they are created
      puts "Created product: #{product.name} in category: #{category.name}"
    end
  else
    puts "Failed to create category: #{category.errors.full_messages.join(', ')}"
  end
end
