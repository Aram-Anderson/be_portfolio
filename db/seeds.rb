# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Aram",
                 last_name: "Anderson",
                 password: "123456",
                 email: "aram@aram.com",
                 admin: true)

10.times do
  User.create(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email,
                   password: "123456")
end

10.times do
  Post.create(title: Faker::Internet.domain_word,
            body: LiterateRandomizer.paragraph,
            user: User.where(admin: true).first)
end

users = User.all
posts = Post.all

50.times do
  Comment.create(body: LiterateRandomizer.paragraph,
                 user_id: users.sample.id,
                 post_id: posts.sample.id)
end
