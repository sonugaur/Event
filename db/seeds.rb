User.create!(name:  "Sonu Kumar",
             email: "sonu@cyberdude.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.events.create!(content: content) }
end