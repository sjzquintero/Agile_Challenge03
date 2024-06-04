require_relative 'ar.rb'

# Fetch all categories from the database
categories = Category.all

# Display each category name and its associated products
categories.each do |category|
  puts "Category: #{category.name}"
  
  products = category.products
  if products.any?
    products.each do |product|
      puts "  Product Name: #{product.name}, Price: #{product.price}"
    end
  else
    puts "  No products available in this category."
  end
end