# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# . . .
Product.create!(title: "Michael <3 Leslie",
  description: %{The girl in the picture is my Leslie},
  image_url: 'leslie.jpg',
  price: 528.13)
# . . .
Product.create!(title: "Leslie <3 Michael",
  description: %{The girl in the picture is my Leslie},
  image_url: 'leslie.jpg',
  price: 528.13)
# . . .
Product.create!(title: "My one and only Leslie",
  description: %{The girl in the picture is my Leslie},
  image_url: 'leslie.jpg',
  price: 528.13)
# . . .