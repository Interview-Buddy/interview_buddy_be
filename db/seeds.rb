# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Meeting.destroy_all

colin = User.create!( first_name: "Colin", last_name: "Reinhart", email: "email@gmail.com", password: "password", user_type: "student")
joseph = User.create!( first_name: "Joseph", last_name: "Downs", email: "test@gmail.com", password: "password", user_type: "alum", company: "AirBnb")

Meeting.create!( start_time: "10", end_time: "11", interview_type: 0, date: "08/09/2023", user_id: joseph.id )