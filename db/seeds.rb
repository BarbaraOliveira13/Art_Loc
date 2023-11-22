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
  URI.open("https://www.francetvinfo.fr/pictures/NalhS6o28H8Oe8SBakhDOYH1iUc/fit-in/720x/2019/04/12/000_par8284437.jpg"),
  URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Bouquet_of_lilies_clock_01_by_shakko.jpg/800px-Bouquet_of_lilies_clock_01_by_shakko.jpg"),
  URI.open("https://s.rfi.fr/media/display/0c9a7688-109f-11ea-bb1c-005056bf7c53/w:980/p:16x9/2017-10-24t094416z_1575050207_rc1c97ef1c40_rtrmadp_3_britain-art.jpg"),
  URI.open(""),
  URI.open(""),
  URI.open(""),
  URI.open(""),
  URI.open(""),
]


offers = [

  {title: "La Joconde", content: "", price: 12.50, category: "peinture" },
  {title: "Oeuf de Fabergé", content: "Bois de sureau et plume d'aigle", price: 39.90, category: "Sorcier" },
  {title: "Salvator Mundi", content: "Devenez 100% transparent!", price: 99.99, category: "Sorcier" },
  {title: "toto", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },
  {title: "Dishoom", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },
  {title: "Baguette magique", content: "Bois de sureau et plume d'aigle", price: 39.90, category: "Sorcier" },
  {title: "Cape d'invisibilité", content: "Devenez 100% transparent!", price: 99.99, category: "Sorcier" },
  {title: "toto", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },


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
