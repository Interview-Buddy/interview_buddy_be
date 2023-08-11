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

    end

end