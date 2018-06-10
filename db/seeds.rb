# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LitGuide.destroy_all
20.times {
  LitGuide.create!(title: Faker::Book.unique.title, text: Faker::Lorem.paragraphs(rand(5..12)).map { |p| "<p>#{p}</p>" }.join(''))
}
