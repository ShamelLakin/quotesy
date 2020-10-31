# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tech = Category.create(name: "Tech")
jesus = Category.create(name: "Jesus")
love = Category.create(name: "Love")

Quote.create(quote: "I am invincible", author: "Shamel Lakin", tag: "tech", category_id: tech.id)