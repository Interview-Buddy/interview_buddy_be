module Mutations
  class DeleteMeeting < BaseMutation
    argument :id, ID, required: true
    field :success, Boolean

    def resolve(id:)
      meeting = Meeting.find(id)
      if meeting.destroy
        { success: true }
      else
        raise GraphQL::ExecutionError.new "Error deleting user", extensions: user.errors.to_hash
        { success: false}
      end
    end
  end
end