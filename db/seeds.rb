require 'faker'

5.times do
  user = User.create!(
  name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end
users = User.all

10.times do
  item = Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
items = Item.all


user = User.first
user.update_attributes!(
  name: 'Stephanie',
  email: 'stephaniepui@outlook.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
