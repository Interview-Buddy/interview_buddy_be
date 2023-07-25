module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :user_update, mutation: Mutations::UserUpdate
        field :user_delete, mutation: Mutations::UserDelete
  end
end
