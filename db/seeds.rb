# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
woody = Director.create!(name: "Woody Allen")
manhattan = woody.movies.create!(title: "Manhattan",
                                 oscar: false,
                                 nominations: 2)

annie = woody.movies.create!(title: "Annie Hall",
                             oscar: true,
                             nominations: 3)
