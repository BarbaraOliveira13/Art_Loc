# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "start"

puts "create first user"
user = User.create(email: "contact@artloc.com", password: "123456")
puts "user created"

offers = [

  {title: "Dishoom", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },
  {title: "Baguette magique", content: "Bois de sureau et plume d'aigle", price: 39.90, category: "Sorcier" },
  {title: "Cape d'invisibilité", content: "Devenez 100% transparent!", price: 99.99, category: "Sorcier" },
  {title: "toto", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },

]
count = 1
offers.each do |offer|
  offer[:user] = user
  Offer.create!(offer)
  puts count
  count += 1
end

puts "end"
