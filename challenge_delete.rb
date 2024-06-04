require_relative 'ar.rb'

#find the product we added
product_to_delete = Product.find_by(name: 'Product X') 

if product_to_delete
  # Delete the product from the database 
    product_to_delete.destroy
  puts "Product '#{product_to_delete.name}' has been deleted."
else
  puts "Product not found."
end