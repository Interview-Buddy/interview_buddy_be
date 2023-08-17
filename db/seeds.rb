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
lucas = User.create!( first_name: "Lucas", last_name: "Merchant", email: "test23@gmail.com", password: "password", user_type: "alum", company: "Ibotta", pronouns: 'he/they')
anthony = User.create!( first_name: "Anthony", last_name: "Shellman", email: "test24@gmail.com", password: "password", user_type: "student", pronouns: "he/him")


Meeting.create!( start_time: "10", end_time: "11", interview_type: 0, date: "08/09/2023", user_id: joseph.id, student_id: colin.id, title: "Interview with Joseph Downs and Colin Reinhart" )
Meeting.create!( start_time: "10", end_time: "11", interview_type: 1, date: "08/10/2023", user_id: joseph.id, title: "Interview with Joseph Downs" )
Meeting.create!( start_time: "10", end_time: "11", interview_type: 2, date: "08/11/2023", user_id: lucas.id, title: "Interview with Lucas Merchant" )
Meeting.create!( start_time: "12", end_time: "1", interview_type: 1, date: "08/11/2023", user_id: lucas.id, title: "Interview with Lucas Merchant" )
Meeting.create!( start_time: "10", end_time: "11", interview_type: 0, date: "08/12/2023", user_id: joseph.id, student_id: anthony.id, title: "Interview with Joseph Downs and Anthony Shellman" )