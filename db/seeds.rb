# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roy = User.create!(email: 'roy@example.com', password: 'password')
peko = User.create!(email: 'peko@example.com', password: 'password')

5.times do
	roy.tasks.create!(
		name: Faker::Lorem.sentence(word_count: 10),
		content: Faker::Lorem.sentence(word_count: 10)
	)
end

5.times do
	peko.tasks.create!(
		name: Faker::Lorem.sentence(word_count: 10),
		content: Faker::Lorem.sentence(word_count: 10)
	)
end