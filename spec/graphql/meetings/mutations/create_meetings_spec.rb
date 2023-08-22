require 'rails_helper'

RSpec.describe Mutations::CreateMeeting, type: :request do
  it 'can create a meeting using display name' do
    carl = User.create!(first_name: "Colin", last_name: "R", pronouns: "he/him", display_name: "Colin4Prez", uuid: "ytehr", user_type: "alum", company: "NASA", email: "test@test.com")
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

  it 'can create a meeting using first and last name' do
    josh = User.create!(first_name: "Joseph", last_name: "Downs", pronouns: "he/him", user_type: "alum", company: "Tesla", email: "test@aol.com", uuid: "uulrnh")

    post "/graphql", params: {
      query: <<-GRAPHQL

        mutation {
          createMeeting(
              input : {
                  startTime: "11"
                  endTime: "12"
                  interviewType: 1
                  userId: #{josh.id}
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
    expect(data['title']).to eq("Interview with Joseph Downs")
  end
end
