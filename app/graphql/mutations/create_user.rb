module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :user_type, Integer, required: true
    argument :display_name, String, required: false
    argument :pronouns, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(first_name:, last_name:, password:, user_type:, email:, display_name:, pronouns:)
      user = User.new(first_name: first_name, last_name: last_name, password: password, user_type: user_type, 
        email: email, pronouns: pronouns, display_name: display_name)
      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
