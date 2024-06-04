require_relative 'ar.rb'

# Method One: Create a Product in "object space"
new_product = Product.new

new_product.name = "Product X"
new_product.description = "Description for Product X"
new_product.price = 25.0
new_product.stock_quantity = 5
new_product.category_id = 1

# Saving the new product.
new_product.save

# Calling inspect on the object to inspect its details.
puts new_product.inspect

# Method Two: Create a Product in "object space"
# This time we set the required properties as key/value arguments of the new method.
product_y = Product.new(
  name: "Product Y",
  description: "Description for Product Y",
  price: 35.0,
  stock_quantity: 10,
  category_id: 1
)

# Saving the new product.
product_y.save

# Calling inspect on the object to inspect its details.
puts product_y.inspect

# Method Three: Create a Product and persist it to the database in one step.
product_z = Product.create(
  name: "Product Z",
  description: "Description for Product Z",
  price: 45.0,
  stock_quantity: 15,
  category_id: 1
)

# We can call inspect on any object to inspect its internals.
puts product_z.inspect

# Create a Product with missing required columns.
product_with_errors = Product.new(
  name: "P",
  description: "",
  price: nil,
  stock_quantity: nil,
  category_id: 1
)

# Attempt to save this product and print all the AR errors which are generated.
if product_with_errors.save
  puts "Product with errors saved successfully"
else
  puts "Product with errors could not be saved"
  puts product_with_errors.errors.full_messages
end