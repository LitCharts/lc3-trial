# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  book = Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author
    )

  passage = Passage.create(
    book_id: book.id,
    content:  Faker::Lorem.paragraphs
    )

  4.times do |theme|
    passage.themes << Theme.create(name: Faker::Hipster.word)
    passage.literary_symbols << LiterarySymbol.create(name: Faker::Science.element)
  end
end