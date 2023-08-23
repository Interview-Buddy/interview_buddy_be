require 'rails_helper'
require 'pry'

RSpec.describe Mutations::DeleteMeeting, type: :request do
  
  it "can delete a meeting" do
    user1 = User.create!(first_name: "Charles Wallace", last_name: "Murray", email: "charles@aol.com", uuid: "password23", user_type: 1, pronouns: "he/him", display_name: "Charles Wallace", company: "Google")
    meeting1 = Meeting.create!(start_time: '11', end_time: '12', date: '09/01/2023', user_id: user1.id, interview_type: 2)
    meeting2 = Meeting.create!(start_time: '11', end_time: '12', date: '09/01/2023', user_id: user1.id, interview_type: 1)

    expect(Meeting.count).to eq(2)
    expect(Meeting.find(meeting1.id)).to eq(meeting1)

    post '/graphql', params: {
      query: <<-GRAPHQL
        mutation {
          deleteMeeting(
            input: {
              id: #{meeting1.id}
            }
          ) {
            success
            }
        }
        GRAPHQL
    }

    data = JSON.parse(response.body)['data']['deleteMeeting']
    expect(response).to have_http_status(:success)
    expect(Meeting.count).to be(1)
    expect(data['success']).to be(true)
  end
end