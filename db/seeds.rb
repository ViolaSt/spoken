require 'faker'

User.create(
  first_name: "Jay",
  last_name: "Gatsby",
  tagline: "Amazing author",
  email: "jay.gatsby@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Hannibal",
  last_name: "Lecter",
  email: "hannibal.lecter@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Scarlett",
  last_name: "O'Hara",
  email: "scarlett.o.hara@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Dorian",
  last_name: "Gray",
  email: "dorian.gray@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Big",
  last_name: "Brother",
  email: "big.brother1984@gmail.com",
  password: "123456",
)

30.times do
  Article.create(
    title: Faker::Lorem.sentence(rand(2..10)).chomp('.'),
    content: Faker::Lorem.paragraphs(1),
    user_id: rand(1..5)
  )
end

60.times do
  Reading.create(
    article_id: rand(1..30),
    user_id: rand(1..5),
  )
end

20.times do
  Comment.create(
    reading_id: rand(1..60),
    title: Faker::Lorem.sentence(rand(1..4)).chomp('.'),
    content: Faker::Lorem.paragraphs(1),
  )
end

20.times do
  Following.create(
    author_id: rand(1..5),
    follower_id: rand(1..5)
  )
end
