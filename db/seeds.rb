# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

restaurant_1 = Restaurant.find_or_create_by!(name: "Warung Nusantara") do |r|
  r.address = "Jl. Merdeka No. 10, Jakarta"
  r.phone = "+62 21 555 1111"
  r.opening_hours = "10:00 - 22:00"
end

restaurant_2 = Restaurant.find_or_create_by!(name: "Bistro Santai") do |r|
  r.address = "Jl. Sudirman No. 25, Bandung"
  r.phone = "+62 22 555 2222"
  r.opening_hours = "09:00 - 23:00"
end

menu_items_data = [
  {
    restaurant: restaurant_1,
    name: "Pisang Goreng Keju",
    description: "Pisang goreng renyah dengan topping keju parut dan susu kental manis.",
    price: 15000,
    category: "appetizer",
    is_available: true
  },
  {
    restaurant: restaurant_1,
    name: "Nasi Goreng Spesial",
    description: "Nasi goreng dengan ayam, telur, dan kerupuk.",
    price: 28000,
    category: "main",
    is_available: true
  },
  {
    restaurant: restaurant_1,
    name: "Sate Ayam",
    description: "10 tusuk sate ayam dengan bumbu kacang dan lontong.",
    price: 32000,
    category: "main",
    is_available: true
  },
  {
    restaurant: restaurant_1,
    name: "Es Teh Manis",
    description: "Teh melati dingin dengan gula.",
    price: 8000,
    category: "drink",
    is_available: true
  },
  {
    restaurant: restaurant_1,
    name: "Es Cendol",
    description: "Minuman tradisional dengan cendol, gula merah, dan santan.",
    price: 12000,
    category: "dessert",
    is_available: true
  },
  {
    restaurant: restaurant_2,
    name: "Garlic Bread",
    description: "Roti panggang dengan mentega bawang putih.",
    price: 18000,
    category: "appetizer",
    is_available: true
  },
  {
    restaurant: restaurant_2,
    name: "Chicken Alfredo Pasta",
    description: "Pasta krim dengan ayam dan keju parmesan.",
    price: 45000,
    category: "main",
    is_available: true
  },
  {
    restaurant: restaurant_2,
    name: "Beef Burger",
    description: "Burger daging sapi dengan keju, selada, dan tomat.",
    price: 42000,
    category: "main",
    is_available: true
  },
  {
    restaurant: restaurant_2,
    name: "Chocolate Lava Cake",
    description: "Kue cokelat hangat dengan isi cokelat lumer.",
    price: 28000,
    category: "dessert",
    is_available: true
  },
  {
    restaurant: restaurant_2,
    name: "Lemon Iced Tea",
    description: "Es teh lemon segar.",
    price: 15000,
    category: "drink",
    is_available: true
  }
]

menu_items_data.each do |attrs|
  MenuItem.find_or_create_by!(
    name: attrs[:name],
    restaurant: attrs[:restaurant]
  ) do |item|
    item.description = attrs[:description]
    item.price = attrs[:price]
    item.category = attrs[:category]
    item.is_available = attrs[:is_available]
  end
end