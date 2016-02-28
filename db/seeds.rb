# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({email: 'user@nivelr.com',password: "clave12345", password_confirmation: "clave12345"})
user2 = User.create({email: 'admin@gmail.com', password: "angular2", password_confirmation: "angular2"})

tags = [{ tag_name: 'cerveza'},
        { tag_name: 'pizza'},
        { tag_name: 'lavanderia'},
        { tag_name: 'internet'},
        { tag_name: 'Servicios prestados'}
      ]

tags.each do |tag|
   Tag.create!(tag)
end

transactions = [{ tag_id: '1', amount: Faker::Number.between(75, 275), amount_type: 0, user_id: user2.id},
        { tag_id: '2', amount: Faker::Number.between(75, 275), amount_type: 0, user_id: user2.id},
        { tag_id: '3', amount: Faker::Number.between(75, 275), amount_type: 0, user_id: user2.id},
        { tag_id: '5', amount: Faker::Number.between(75, 275), amount_type: 1, user_id: user2.id},
        { tag_id: '5', amount: Faker::Number.between(75, 275), amount_type: 1, user_id: user2.id},
        { tag_id: '3', amount: Faker::Number.between(75, 275), amount_type: 0, user_id: user2.id},
        { tag_id: '4', amount: Faker::Number.between(75, 275), amount_type: 0, user_id: user2.id}
      ]

transactions.each do |transaction|
   Transaction.create!(transaction)
end

#Fechas
transactions = [{ created_at: "22/02/2016", tag_id: '1', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "23/02/2016", tag_id: '2', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "24/02/2016", tag_id: '3', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "25/02/2016", tag_id: '5', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "26/02/2016", tag_id: '5', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "27/02/2016", tag_id: '3', amount: 275, amount_type: 0, user_id: 1},
        { created_at: "28/02/2016", tag_id: '4', amount: 275, amount_type: 0, user_id: 1}
      ]

transactions.each do |transaction|
   Transaction.create!(transaction)
end
