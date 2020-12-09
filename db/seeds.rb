# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User
puts "\nCreate Admin User"
User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@test.com",
    password: 12345678,
    role: 1
)

# Default Users
3.times do
    puts "\nCreate Default User"
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email ,
        password: 12345678,
        role: 0
    )
end
