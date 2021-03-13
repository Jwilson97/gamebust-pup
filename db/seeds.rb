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
            price: rand(5..10),
            console: %w[First\ Person\ Shooter Survival Action-adventure Sports Role-playing Real-time\ strategy].sample,
            category: %w[Playstation\ 5 Playstation\ 4 Nintendo\ switch Xbox\ One  Xbox\ X/S].sample,
            description: Faker::Marketing.buzzwords,
            user_id: user.id
        )
    file = File.open("app/assets/images/gears.jpg")
    game.photo.attach(io: file, filename: 'gears.jpg', content_type: 'image/jpg')
    game.save
end

# puts Dir.pwd
