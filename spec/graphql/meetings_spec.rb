require 'rails_helper'

RSpec.describe Mutations::CreateMeeting, type: :request do
  it 'can create a meeting' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com")
    post "/graphql", params: {
      query: <<-GRAPHQL

        mutation {
          createMeeting(
              input : {
                  startTime: "11"
                  endTime: "12"
                  interviewType: 1
                  userId: #{carl.id}
                  date: "08/20/2023"
                  studentId: null
                  title: null
              }
          ) {
              meeting{
                  id
                  title
              }
          }
      }
      GRAPHQL
    }
    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body)['data']['createMeeting']['meeting']
    expect(data['title']).to eq("Interview with Colin4Prez")

  end

  it 'can find all meetings by user id' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com")
    meeting1 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting2 = Meeting.create!(start_time: "9", end_time: "6", interview_type: "both", student_id: "#{josh.id}", user_id: "#{carl.id}", date: "11/12/22")
    meeting3 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting4 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting5 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting6 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")

    post "/graphql", params: {
      query: <<-GRAPHQL
        {
	        meetingByUser(userId: #{josh.id}) {
	        	id
            startTime
            endTime
            interviewType
            studentId
            userId
            date
            title
        	}
        }
      GRAPHQL
    }
    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body)['data']['meetingByUser']

    expect(data.count).to eq(5)
  end

  it 'can find meeting by type' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com")
    meeting1 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting2 = Meeting.create!(start_time: "9", end_time: "6", interview_type: "both", student_id: "#{josh.id}", user_id: "#{carl.id}", date: "11/12/22")
    meeting3 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting4 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting5 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting6 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")

    post "/graphql", params: {
      query: <<-GRAPHQL
        {
	        meetingByInterviewType(interviewType: "technical") {
	        	id
            startTime
            endTime
            interviewType
            studentId
            userId
            date
            title
        	}
        }
      GRAPHQL
    }
    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body)['data']['meetingByInterviewType']
require 'pry'; binding.pry

    expect(data.count).to eq(5)
  end
end
