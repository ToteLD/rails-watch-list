require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Bookmark.destroy_all
  List.destroy_all
  Movie.destroy_all
end
url = 'http://tmdb.lewagon.com/movie/top_rated'

opened_url = open(url).read
movies = JSON.parse(opened_url)

movies['results'].each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
  )
end

List.create!(name: 'My favorites')
List.create!(name: 'Drama')
List.create!(name: 'Comedy')

3.times do
  Bookmark.create!(
    comment: 'A voir',
    movie: Movie.all.sample,
    list: List.all.sample
  )
end
