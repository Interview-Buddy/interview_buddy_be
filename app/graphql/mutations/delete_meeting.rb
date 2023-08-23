module Mutations
  class DeleteMeeting < BaseMutation
    argument :id, ID, required: true
    field :success, Boolean

    def resolve(id:)
      meeting = Meeting.find(id)
      if meeting.destroy
        { success: true }
      end
    end
  end
end