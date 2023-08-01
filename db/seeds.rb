# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!( first_name: "Colin", last_name: "Reinhart", email: "email@gmail.com", password: "password", user_type: "student")
User.create!( first_name: "Joseph", last_name: "Downs", email: "test@gmail.com", password: "password", user_type: "alum")

Meeting.create!(start_time: "10", end_time: "11", alum_id: 2, interview_type: 0, date: "Thursday")