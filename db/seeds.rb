# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Order.destroy_all
CartItem.destroy_all
Item.destroy_all
Cart.destroy_all
User.destroy_all

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456")
end

7.times do
  Cart.create!(
    user_id: rand(User.first.id..User.last.id)
  )
end

10.times do
  Item.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: rand(1..100)
  )
end

6.times do
  CartItem.create!(
    item_id: rand(Item.first.id..Item.last.id),
    cart_id: rand(Cart.first.id..Cart.last.id)
  )
end

10.times do
  check = 1
  while (check ==1)
    cart_id= rand(Cart.first.id..Cart.last.id)
    if Cart.find(cart_id).cart_items.size != 0
      check = 0
    end
  end

  Order.create!(
    user_id: rand(User.first.id..User.last.id),
    cart_id: cart_id)
end
