module Types
  class MutationType < Types::BaseObject
    # users
    field :create_user, mutation: Mutations::CreateUser
    field :user_update, mutation: Mutations::UserUpdate
    field :user_delete, mutation: Mutations::UserDelete

    # meetings
    field :create_meeting, mutation: Mutations::CreateMeeting
    field :delete_meeting, mutation: Mutations::DeleteMeeting
  end
end
