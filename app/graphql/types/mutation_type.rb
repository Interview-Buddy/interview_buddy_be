module Types
  class MutationType < Types::BaseObject
    # users
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser

    # meetings
    field :create_meeting, mutation: Mutations::CreateMeeting
    field :update_meeting, mutation: Mutations::UpdateMeeting
  end
end
