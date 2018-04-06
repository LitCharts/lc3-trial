# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|
  author = Author.create(name: Faker::Book.author)
  book = Book.create(title: Faker::Book.title, author: author)
  Theme.create(title: Faker::Book.title, description: Faker::Lorem.paragraphs(1)[0], book: book)
end
