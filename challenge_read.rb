require_relative 'ar.rb'

# Get the total number of products
number_of_products = Product.count

# Get the column names of the products table
columns = Product.column_names

# Find all products with a price greater than $10 and a name starting with 'C'
products_above10_startingc = Product.where('price > ? AND name LIKE ?', 10, 'C%').select(:name)

# Print the names of these products
puts "Products with a price above $10 and a name starting with 'C':"
products_above10_startingc.each do |product|
  puts product.name
end

# Get the count of products with low stock (stock quantity less than 5)
low_stock_count = Product.where('stock_quantity < ?', 5).count

# Print the count of low stock products
puts "\nTotal number of products with low stock: #{low_stock_count}"

# Print the total number of products in the products table
puts "Total number of products in the products table: #{number_of_products}"

# Print the column names of the products table
puts "\nColumn names in the products table:"
puts columns.join(', ')

# Find the category associated with one of the products

sample_product = Product.where('stock_quantity < ?', 5).first

if sample_product
  # Access the associated category
  category = sample_product.category

  if category
    # Print the name of the associated category
    puts "\nThe category associated with the product '#{sample_product.name}' is '#{category.name}'."
  else
    puts "\nThe product '#{sample_product.name}' does not have a category associated."
  end
else
  puts "\nNo products found with low stock."
end



condiments = Category.where(:name => 'Condiments').first

puts "In the condiments category we have #{condiments.products.size} products."

# Associating a new product with an existing category 

new_product = Product.new( name:  'New product',
                           description: "Description for the new Product ",
                           price: 35.0,
                           stock_quantity: 10,
                           category_id: 2)

# Assign an existing Category object to the product.
# This will automatically set the product's category_id
# foreign key.

new_product.category = condiments

new_product.save

puts new_product.inspect


products_over_threshold = condiments.products.where('price > ?', 10)

if products_over_threshold.any?
  puts "Products in the category 'Condiments' with price over $50:"
  products_over_threshold.each do |product|
    puts "#{product.name}: $#{product.price}"
  end
else
  puts "No products found in the category 'Condiments' with price over $10."
end