# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
    email: Faker::Internet.email,
    password: "123456"
)
puts "#{user} created"
user.save

5.times do
    game = Game.new(
            title: Faker::Game.title,
            description: Faker::Marketing.buzzwords,
            price: rand(5..10),
            console: Faker::Game.platform,
            category: Faker::Game.genre,
            user_id: user.id
        )
    game.save
end

