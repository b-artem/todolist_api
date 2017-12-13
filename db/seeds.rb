# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  {email: "user@user.ua", password: "password" },
  {email: "user2@user.ua", password: "password2" }
])

Project.create!([
  { name: 'Trip to a new place', user_id: 1 },
  { name: 'Another project', user_id: 1 },
  { name: 'Project number 3', user_id: 2 }
])
