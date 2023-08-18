# frozen_string_literal: true

module Mutations
  class UpdateUser < BaseMutation
    description "Updates a user by id"

    field :user, Types::UserType, null: false

    argument :id, ID, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :pronouns, String, required: false
    argument :user_type, Integer, required: false
    argument :company, String, required: false

    def resolve(id:, **args)
      user = ::User.find(id)
      raise GraphQL::ExecutionError.new "Error updating user", extensions: user.errors.to_hash unless user.update(**args)

      { user: user }
    end
  end
end
