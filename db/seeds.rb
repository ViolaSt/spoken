require 'faker'

User.create(
  first_name: "Jay",
  last_name: "Gatsby",
  tagline: "Amazing author",
  email: "jay.gatsby@gmail.com",
  password: "123456",
  remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496151659/gatsby_yksekr.jpg",
)
User.create(
  first_name: "Hannibal",
  last_name: "Lecter",
  tagline: "Great author",
  email: "hannibal.lecter@gmail.com",
  password: "123456",
  remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496151659/hannibal_w7t18i.jpg",
)
User.create(
  first_name: "Scarlett",
  last_name: "O'Hara",
  tagline: "Excellent author",
  email: "scarlett.o.hara@gmail.com",
  password: "123456",
  remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496151659/scarlett_ymwyac.jpg",
)
User.create(
  first_name: "Dorian",
  last_name: "Gray",
  tagline: "Unbelievable author",
  email: "dorian.gray@gmail.com",
  password: "123456",
  remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496151659/dorian_etvtql.jpg",
)
User.create(
  first_name: "Big",
  last_name: "Brother",
  tagline: "Outrageous author",
  email: "big.brother1984@gmail.com",
  password: "123456",
  remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496151659/big_brother_qepxqt.jpg",
)

30.times do
  Article.create(
    title: Faker::Lorem.sentence(rand(2..10)).chomp('.'),
    description: Faker::Lorem.paragraphs(1),
    user_id: rand(1..5),
    remote_photo_url: "http://res.cloudinary.com/dijz3a59v/image/upload/v1496142349/sxzmqgim9xx4rxdyfmpl.jpg",
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
    follower_id: rand(1..5),
  )
end
