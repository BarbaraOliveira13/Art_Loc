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
  URI.open("https://1.bp.blogspot.com/-NnxOREK3qGM/W7ub8s-G9uI/AAAAAAAAQ5M/Or5VhTr-iVkMOYCU9JRE-rmBUM2JntCzQCLcBGAs/s1600/1009L18024_9YKNK.jpg"),
  URI.open("https://www.centrepompidou.fr/media/picture/ba/b4/bab45a073cd09f2b8adbdd6888c26ee1/thumb_large.jpg"),
  URI.open("https://balcondart.com/wp-content/uploads/2019/12/191205-art-basel-banana.jpg"),
  URI.open("https://images.rtl.fr/~c/1200v800/rtl/www/1101227-une-grande-exposition-a-la-fondation-vuitton.jpg"),
]




offers = [
  {title: "La Joconde", content: "a", price: 5_000_000, category: "Peinture" },
  {title: "Oeuf de Fabergé", content: "Bois de sureau et plume d'aigle", price: 15_000, category: "Art" },
  {title: "Salvator Mundi", content: "Devenez 100% transparent!", price: 2_000_000, category: "Peinture" },
  {title: "La petite fille au balon ", content: "7 Boundary St, London E2 7JE", price: 5500, category: "Peinture" },
  {title: "Ballon Dog", content: "7 Boundary St, London E2 7JE", price: 6_900, category: "french" },
  {title: "Banane", content: "Bois de sureau et plume d'aigle", price: 3900.90, category: "Sorcier" },
  {title: "Le Cri", content: "Devenez 100% transparent!", price: 6900.99, category: "Sorcier" },
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
