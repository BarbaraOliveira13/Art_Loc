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


require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Leonardo_da_vinci%2C_la_gioconda%2C_1503-06_circa.jpg/220px-Leonardo_da_vinci%2C_la_gioconda%2C_1503-06_circa.jpg")
article = Article.new(title: "La Joconde", content: "La Joconde (en italien: La Gioconda ), ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ", price: 10000000, category:"peinture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://d1ee3oaj5b5ueh.cloudfront.net/thumbs/787xAUTO_original_article_2023_08_f204e49d-84eb-45e2-bbe8-164c4a6d684e.jpg")
article = Article.new(title: "Salvator Mundi", content: "", price: 4500000, category:"peinture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://www.francetvinfo.fr/pictures/g7mlvm_QT74yVwzUizya-e3Lve0/1200x1200/2019/04/12/banksy_2.jpg")
article = Article.new(title: "Girl with balloon", content: "A great console", price: 200000, category:"peinture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/cc/Madonna_Lily_Egg.jpg")
article = Article.new(title: "Oeuf de Fabergé", content: "A great console", price: 200000, category:"peinture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://arthisto.fr/wp-content/uploads/2016/11/buste-de-nefertiti.jpg")
article = Article.new(title: "Buste de la reine Nefertiti", content: "A great console", price: 50000, category:"sculpture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://cdn-s-www.leprogres.fr/images/E3199B5E-D4D3-4E7C-8C02-5A2303E97A91/NW_raw/jeff-koons-est-connu-entre-autres-pour-ses-sculptures-semblant-faites-avec-des-ballons-comme-ici-ce-balloon-dog-bleu-ici-d-une-taille-imposante-photo-sipa-rex-shutterstock-1676795360.jpg")
article = Article.new(title: "Jeff Koons", content: "A great console", price: 5000, category:"peinture")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

file = URI.open("https://balcondart.com/wp-content/uploads/2019/12/191205-art-basel-banana.jpg")
article = Article.new(title: "Banane", content: "A great console", price: 1500, category:"objet")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save


offers = [

  {title: "Dishoom", content: "7 Boundary St, London E2 7JE", price: 12.50, category: "french" },
  {title: "Baguette magique", content: "Bois de sureau et plume d'aigle", price: 39.90, category: "Sorcier" },
  {title: "Cape d'invisibilité", content: "Devenez 100% transparent!", price: 99.99, category: "Sorcier" }

]
count = 1
offers.each do |offer|
  offer[:user] = user
  Offer.create!(offer)
  puts count
  count += 1
end

puts "end"
