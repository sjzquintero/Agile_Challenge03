require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products_with_high_stock = Product.where("stock_quantity > ?", 40)

# Print the products with their current stock quantity
puts "Products before updating stock quantity:"
products_with_high_stock.each do |product|
  puts "Product ID: #{product.id}, Name: #{product.name}, Stock Quantity: #{product.stock_quantity}"
end

# Add one to the stock quantity of each product and save the changes
products_with_high_stock.each do |product|
  product.stock_quantity += 1
  product.save
end

# Print the products after updating to verify the changes
puts "Products after updating stock quantity:"
products_with_high_stock.each do |product|
  puts "Product ID: #{product.id}, Name: #{product.name}, Stock Quantity: #{product.stock_quantity}"
end