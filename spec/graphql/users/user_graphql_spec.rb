require 'rails_helper'
require 'spec_helper'

RSpec.describe Mutations::CreateUser, type: :request do
    
    it 'can use graphql to create a user' do
        post '/graphql', params: {
            query: <<-GRAPHQL
            mutation {
             createUser(
                 input: {
                    firstName: "Lloyd"
                    lastName: "Christmas"
                    email: "dumb@aol.com"
                    password: "password"
                    userType: 0
                    pronouns: "he/him"
                    displayName: "Lloyd Christmas"
                    company: "I Got Worms"
                  }
                ) {
                    user{
                        firstName
                        lastName
                        email
                        password
                        userType
                        pronouns
                        displayName
                        company
                    }
                }
            }
            GRAPHQL
        }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        data = json_response['data']['createUser']['user']

        expect(data['firstName']).to eq("Lloyd")
        expect(data['lastName']).to eq("Christmas")
        expect(data['email']).to eq("dumb@aol.com")
        expect(data['password']).to eq("password")
        expect(data['userType']).to eq("student")
        expect(data['pronouns']).to eq("he/him")
        expect(data['displayName']).to eq("Lloyd Christmas")
        expect(data['company']).to eq("I Got Worms")        
    end

end