module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :user_update, mutation: Mutations::UserUpdate
  end
end
