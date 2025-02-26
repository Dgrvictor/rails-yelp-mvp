require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Restaurant.destroy_all

5.times do
  puts "Creating restaurants..."
  category_name = ["chinese", "italian", "japanese", "french", "belgian"]
  restaurant = Restaurant.new(name: Faker::Restaurant.name ,address: Faker::Address.full_address ,phone_number: Faker::PhoneNumber.cell_phone ,category: category_name.sample )
  restaurant.save
  puts "Created #{restaurant.name}"
end

puts "Finished! Created #{Restaurant.count} restaurants."

# --------------------------------------------------------

puts "Cleaning database..."
Review.destroy_all

5.times do
  puts "Creating reviews..."
  review = Review.new(rating: rand(0..5) ,content: Faker::Lorem.paragraph, restaurant_id: rand(70..100))
  review.save
  puts "Created review"
end

puts "Finished! Created #{Review.count} reviews."
