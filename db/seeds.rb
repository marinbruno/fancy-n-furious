# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Car.destroy_all
Review.destroy_all
CarWish.destroy_all
Booking.destroy_all

users_array = []


10.times do
  puts 'Creating an user...'
  user_hash = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.street_address,
    user_description: Faker::Hipster.paragraph,
    is_owner: [true, false].sample,
  }
  new_user = User.new(user_hash)
  new_user.save
  users_array << new_user
end

cars_array = []
15.times do
  puts 'Creating a car...'
  car_description_array = Faker::Vehicle.standard_specs
  car_description = ""
  car_description_array.each do |sentence|
    car_description += "#{sentence}, "
  end
  car_hash = {
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.manufacture,
    year: Faker::Vehicle.year,
    car_description: car_description,
    car_location: Faker::Address.city,
    category: Faker::Vehicle.car_type,
    daily_amount: [50, 75, 100, 125, 150].sample,
    user: users_array.sample
  }
  new_car = Car.new(car_hash)
  new_car.save
  cars_array << new_car
end

bookings_array = []
20.times do
  puts 'Creating a booking...'
  booking_hash = {
    user: users_array.sample,
    car: cars_array.sample,
    start_date: Faker::Date.between(3.months.from_now, 6.months.from_now),
    end_date: Faker::Date.between(6.months.from_now, 12.months.from_now),
    total_amount: [300, 600, 900, 1200, 3000].sample,
    status: ['to be confirmed', 'to be paid', 'confirmed', 'rejected'].sample
  }
  new_booking = Booking.new(booking_hash)
  new_booking.save
  bookings_array << new_booking
end

10.times do
  puts 'Creating a review...'
  review_hash = {
    content: Faker::Restaurant.review,
    rating: [1, 2, 3, 4, 5].sample,
    booking: bookings_array.sample
  }
  Review.create!(review_hash)
end

15.times do
  puts 'Creating a car wish...'
  car_wish_hash = {
    user: users_array.sample,
    car: cars_array.sample
  }
  CarWish.create!(car_wish_hash)
end

user_photo_url = 'https://images.unsplash.com/photo-1418833893919-fa9c83e8d69e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'
car_photo_url = 'https://images.unsplash.com/photo-1542559292-7c149bc5a20f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'

users_array.each do |user|
  puts 'Saving photo to user...'
  user.remote_photo_url = user_photo_url
  user.save
end

cars_array.each do |car|
  puts 'Saving photo to car...'
  car.remote_photo_url = car_photo_url
  car.save
end
