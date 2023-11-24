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
Reservation.destroy_all
Offer.destroy_all
User.destroy_all

puts "create first user"
user = User.create(email: "contact@artloc.com", password: "123456", password_confirmation: "123456")
user_l = User.create(email: "lilianbg@artloc.com", password: "123456", password_confirmation: "123456")
user_b = User.create(email: "barbara@artloc.com", password: "123456", password_confirmation: "123456")
puts "user created"

file = [
  URI.open("https://www.francetvinfo.fr/pictures/NalhS6o28H8Oe8SBakhDOYH1iUc/fit-in/720x/2019/04/12/000_par8284437.jpg"),
  URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Bouquet_of_lilies_clock_01_by_shakko.jpg/800px-Bouquet_of_lilies_clock_01_by_shakko.jpg"),
  URI.open("https://s.rfi.fr/media/display/0c9a7688-109f-11ea-bb1c-005056bf7c53/w:980/p:16x9/2017-10-24t094416z_1575050207_rc1c97ef1c40_rtrmadp_3_britain-art.jpg"),
  URI.open("https://1.bp.blogspot.com/-NnxOREK3qGM/W7ub8s-G9uI/AAAAAAAAQ5M/Or5VhTr-iVkMOYCU9JRE-rmBUM2JntCzQCLcBGAs/s1600/1009L18024_9YKNK.jpg"),
  URI.open("https://www.centrepompidou.fr/media/picture/ba/b4/bab45a073cd09f2b8adbdd6888c26ee1/thumb_large.jpg"),
  URI.open("https://balcondart.com/wp-content/uploads/2019/12/191205-art-basel-banana.jpg"),
  URI.open("https://images.rtl.fr/~c/1200v800/rtl/www/1101227-une-grande-exposition-a-la-fondation-vuitton.jpg"),
  URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Rodin_-_Le_Baiser_06.jpg/1024px-Rodin_-_Le_Baiser_06.jpg"),
  URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg/2560px-Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg"),

  URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg/1280px-The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg"),

]

  Offer.create!(title: "La Joconde", content: "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506.", price: 5_000_000, category: "Peinture", user_id: user.id)
  Offer.create!(title: "Oeuf de Fabergé", content: "Les œufs de Fabergé sont des objets précieux créés par le joillier Karl Fabergé né en Russie à Saint Petersbourg. ", price: 15_000, category: "Art", user_id: user_l.id)
  Offer.create!(title: "Salvator Mundi", content: "Le Salvator Mundi est une peinture à l'huile sur bois de noyer, sur le thème du Christ rédempteur, attribuée par plusieurs experts à Léonard de Vinci", price: 2_000_000, category: "Peinture", user_id: user.id)
  Offer.create!(title: "La Petite Fille au ballon", content: "est une série d'œuvres d'art urbain par Banksy, une peinture au pochoir apparue pour la première fois en 2002 à Londres sur le pont de Waterloo à South Bank. ", content: "7 Boundary St, London E2 7JE", price: 5500, category: "Peinture", user_id: user.id)
  Offer.create!(title: "Balloon Dog", content: "Balloon Dogs est une sculpture monumentale de l'artiste américain Jeff Koons représentant un chien sculpté à partir d'un ballon.", price: 6_900, category: "french", user_id: user.id)
  Offer.create!(title: "Banane", content: "Nommée Comedian, l'œuvre d'art, réalisée par Maurizio Cattelan, a été acquise pour 120 000 dollars par un collectionneur de nationalité française.", price: 3900.90, category: "Sorcier", user_id: user.id)
  Offer.create!(title: "Le Cri", content: "Le Cri est une œuvre expressionniste de l'artiste norvégien Edvard Munch dont il existe cinq versions réalisées entre 1893 et 1917. Symbolisant l'homme moderne emporté par une crise d'angoisse existentielle.", price: 6900.99, category: "Sorcier", user_id: user.id)
  Offer.create!(title: "Le baiser", content: "Le Baiser est une sculpture représentant un couple enlacé, créée vers 1881 par Auguste Rodin, initialement comme motif pour La Porte de l'Enfer. ", price: 12_000_000, category: "Sculpture", user_id: user_l.id)
  Offer.create!(title: "La naissance de Vénus", content: "La Naissance de Vénus est un tableau de Sandro Botticelli, peint vers 1484-1485 et conservé à la galerie des Offices. ", price: 15_000, category: "Art", user_id: user_l.id)

  Offer.create!(title: "Le baiser", content: "Gustav Klimt (1909)", price: 12_000_000, category: "Peinture", user_id: user_b.id)


puts "pictures"

count = 0
Offer.all.each do |offer|
  puts "start picture"
  offer.photo.attach(io: file[count], filename: "nes.png", content_type: "image/png")
  count += 1
end

puts "end"
