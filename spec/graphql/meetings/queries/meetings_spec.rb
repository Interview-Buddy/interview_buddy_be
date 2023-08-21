require 'rails_helper'
require 'pry'

RSpec.describe 'query meetings', type: :request do
  
  it 'can get all meetings' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com", uuid: "pwwes")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com", uuid: "uulrnh")
    meeting1 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting2 = Meeting.create!(start_time: "9", end_time: "6", interview_type: "both", student_id: "#{josh.id}", user_id: "#{carl.id}", date: "11/12/22")
    meeting3 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting4 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting5 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting6 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")

    post "/graphql", params: {
      query: <<-GRAPHQL
        {
          meetings {
            id
            title
            interviewType
          }
        }
      GRAPHQL
    }
    
    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body)['data']['meetings']
    expect(data.count).to eq(6)
  end

  it 'can find all meetings by user id' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com", uuid: "pwwes")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com", uuid: "uulrnh")
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
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com", uuid: "uuid")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com", uuid: "uuod")
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

    expect(data.count).to eq(5)
  end

  it 'can find a meeting by date' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", user_type: "alum", company: "NASA", email: "test@test.com", uuid: "uuuid")
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", display_name: "joshy", user_type: "alum", company: "Tesla", email: "test@aol.com", uuid: "uudlajg")
    meeting1 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting2 = Meeting.create!(start_time: "9", end_time: "6", interview_type: "both", student_id: "#{josh.id}", user_id: "#{carl.id}", date: "07/19/1988")
    meeting3 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting4 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting5 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")
    meeting6 = Meeting.create!(start_time: "4", end_time: "5", interview_type: "technical", student_id: "#{carl.id}", user_id: "#{josh.id}", date: "11/12/22")

    post "/graphql", params: {
      query: <<-GRAPHQL
        {
          meetingsByDate(date: "11/12/22") {
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
    data = JSON.parse(response.body)['data']['meetingsByDate']

    expect(data.count).to eq(5)
  end
end