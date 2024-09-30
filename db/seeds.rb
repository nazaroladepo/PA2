# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed the RottenPotatoes DB with some movies.
more_movies = [
  { title: 'My Neighbor Totoro', rating: 'G',
    release_date: '16-Apr-1988' },
  { title: 'Green Book', rating: 'PG-13',
    release_date: '16-Nov-2018' },
  { title: 'Parasite', rating: 'R',
    release_date: '30-May-2019' },
  { title: 'Nomadland', rating: 'R',
    release_date: '19-Feb-2021' },
  { title: 'CODA', rating: 'PG-13',
    release_date: '13-Aug-2021' }
]

more_movies.each do |movie|
  Movies.create!(movie)
end

Movies.find_or_create_by!(title: "Inception", rating: "PG-13", release_date: "2010-07-16")

Movies.find_or_create_by!(title: "The Lion King", rating: "G", release_date: "1994-06-24")

Movies.find_or_create_by!(title: "The Shawshank Redemption", rating: "R", release_date: "1994-09-22")

Movies.find_or_create_by!(title: "Parasite", rating: "R", release_date: "2019-05-30")

Movies.find_or_create_by!(title: "Toy Story", rating: "G", release_date: "1995-11-22")

Movies.find_or_create_by!(title: "The Matrix", rating: "R", release_date: "1999-03-31")
