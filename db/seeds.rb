require "open-uri"
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
Offer.destroy_all
User.destroy_all
puts "create first user"
user = User.create(email: "contact@artloc.com", password: "123456")
puts "user created"

file = [
  URI.open("https://www.wpbeginner.com/wp-content/uploads/2020/03/ultimate-small-business-resource-coronavirus.png"),
  URI.open("https://media.gettyimages.com/id/1365857239/fr/vectoriel/petites-ic%C3%B4nes-de-ligne-dinterface-utilisateur-contour-modifiable.jpg?s=612x612&w=gi&k=20&c=kIQh1JdFMFwkLXX_twHoS7ifJIuMzhBcfsw-1iMGKKk="),
  URI.open("https://www.shutterstock.com/image-vector/compact-size-small-scale-fit-260nw-1590167689.jpg"),
]

offers = [

  {title: "Dishoom", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },
  {title: "Baguette magique", content: "Bois de sureau et plume d'aigle", price: 39.90, category: "Sorcier" },
  {title: "Cape d'invisibilité", content: "Devenez 100% transparent!", price: 99.99, category: "Sorcier" }

]

results = []
count = 1
offers.each do |offer|
  offer[:user] = user
  offer_test = Offer.new(offer)
  offer_test.save!
  results << offer_test
  puts count
  count += 1
end

puts "pictures"

count = 0
results.each do |result|
  puts "start picture"
  result.photo.attach(io: file[count], filename: "nes.png", content_type: "image/png")
  count += 1
end

puts "end"
