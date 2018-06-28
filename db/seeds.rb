# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)


99.times do |n|
  name =  Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Coops

Coop.create!( name: "Example Coop",
              description: "A democratic place!")

50.times do |n|
  name = Faker::Company.name
  description = Faker::Lorem.sentence(5)
  Coop.create!(name: name,
               description: description)
end

# Memberships
users = User.all
user = users.first
members = users[2..40]
coops = Coop.all
coop = coops.first
joined_coops = coops[1..7]

members.each        { |new_member| coop.add_member(new_member) }
joined_coops.each   { |new_coop|   user.join_coop(new_coop) }

# Managements
users = User.all
managers = users[1..2]
coop = Coop.first

managers.each { |new_manager| coop.add_manager(new_manager) }
