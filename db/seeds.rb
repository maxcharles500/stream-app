# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
puts "seeding initialized"
puts "Movies..."
  m1 = Movie.create({ 
      title: 'Star Wars: Episode V - The Empire Strikes Back', 
  director: 'Irvin Kershner', 
  description: 'was good!', 
  genre: "Action, Adventure, Fantasy", 
  price: 5.00, 
  rating: 4.00, 
  runtime: "124 min" , 
  released: "20 Jun 1980", 
  image: "https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg" 
})

  m2 = Movie.create({ 
      title: 'Star Wars: Episode IV - A New Hope', 
  director: 'George lucas', 
  description: 'was meh!', 
  genre: 'Action, Adventure, Fantasy', 
  price: 5.00, 
  rating: 2.00, 
  runtime: "121 min" , 
  released: "25 May 1977", 
  image: "https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
})

  m3 = Movie.create({ 
    title: 'Star Wars: Episode VI - Return of the Jedi', 
  director: 'Richard Marquand', 
  description: 'was awesome!', 
  genre: 'Action, Adventure, Fantasy', 
  price: 5.00, 
  rating: 5.00, 
  runtime: '131 min',
  released: '25 May 1983',
  image: "https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
})
  
m4 = Movie.create({ 
    title: 'Star Wars: Episode I - The Phantom Menace',
    director: 'George lucas',
    description: 'liked it a lot!',
    genre: 'sci-fi',
    price: 5.00, 
    rating: 5.00, 
    runtime: '136 min',
  released: '19 May 1999',
  image: "https://m.media-amazon.com/images/M/MV5BYTRhNjcwNWQtMGJmMi00NmQyLWE2YzItODVmMTdjNWI0ZDA2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
})
 
m5 = Movie.create({ 
      title: 'Star Wars: Episode II - Attack of the Clones', 
  director: 'George lucas', 
  description: 'Enjoyed watching this one', 
  genre: 'sci-fi', 
  price: 5.00, 
  rating: 4.56, 
  runtime: '142 min',
  released: '16 May 2002',
  image: "https://m.media-amazon.com/images/M/MV5BMDAzM2M0Y2UtZjRmZi00MzVlLTg4MjEtOTE3NzU5ZDVlMTU5XkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"
})
puts "Users..."
u1 = User.create({
    username: 'Brooks88',
    password: 'brooks123', 
    email: 'brooks123@gmail.com',
    address: '5656 spring CO',
    name: 'Brooks',
    phone: '123-456-9898'
})
u1 = User.create({
    username: 'Nick1234',
    password: 'nick123', 
    email: 'nick123@gmail.com',
    address: '5655 spring CO',
    name: 'Nick',
    phone: '987-654-3112'
})
u1 = User.create({
    username: 'Max57',
    password: 'max123', 
    email: 'max123@gmail.com',
    address: '5656 SF CA',
    name: 'Max',
    phone: '135-798-6425'
})
puts "adding watchlists..." 

User.all.each do |user|
    rand(1..5).times do
      # get a random pizza
      movie = Movie.find(Movie.pluck(:id).sample)
  
      Watchlist.create!(user_id: user.id, movie_id: movie.id, date_rented: Date.new, expiration: Date.new, price: 5.00, rating: 4.50)
    end
  end
  

#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding complete"
