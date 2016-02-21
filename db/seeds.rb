# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({email: 'user@nivelr.com',password: "clave12345", password_confirmation: "clave12345"})
tag = Tag.create({tag_name: 'internet'})

3.times do
  Transaction.create amount: Faker::Number.between(300, 500), amount_type: 0, user_id: user.id, tag_id: tag.id
end
