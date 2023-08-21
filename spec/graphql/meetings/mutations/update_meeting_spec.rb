require 'rails_helper'
require 'pry'

RSpec.describe Mutations::UpdateMeeting, type: :request do
  it 'can update a meeting' do
    user1 = User.create!(first_name: "Lloyd", last_name: "Christmas", email: "dumb@aol.com", uuid: "password", user_type: 0, pronouns: "he/him", display_name: "Lloyd Christmas", company: "I Got Worms")
    meeting = Meeting.create!(start_time: "11", end_time: "12", date: "09/01/2024", interview_type: "behavioral", user_id: user1.id, title: "Interview with Lloyd Christmas")
    user2 = User.create!(first_name: "Meg", last_name: "Murray", email: "meg@gmail.com", uuid: "awit24", user_type: 1, pronouns: "she/her", display_name: "Meg")
    expect(meeting.student_id).to be(nil)
    expect(meeting.interview_type).to eq("behavioral")

    post '/graphql', params: {
      query: <<-GRAPHQL
        mutation {
          updateMeeting(input: {
            id: #{meeting.id},
            studentId: #{user2.id},
            interviewType: "both"
          }) {
            meeting {
              userId
              studentId
            }
          }
        }
      GRAPHQL
    }

    expect(response).to have_http_status(:success)
    json_response = JSON.parse(response.body, symbolize_names: true)
    data = json_response[:data][:updateMeeting]
    updated_meeting = Meeting.find(meeting.id)
    expect(updated_meeting.student_id).to eq(user2.id)
    expect(updated_meeting.interview_type).to eq("both")

  end
end