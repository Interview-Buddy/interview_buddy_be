module Mutations
  class UpdateMeeting < BaseMutation
    description "Updates a meeting by id"

    field :meeting, Types::MeetingType, null: false

    argument :id, ID, required: true
    argument :start_time, String, required: false
    argument :end_time, String, required: false
    argument :alum_id, Integer, required: false
    argument :date, String, required: false
    argument :student_id, Integer, required: false
    argument :interview_type, String, required: false

    def resolve(id:, **args)
      meeting = Meeting.find(id)
      raise GraphQL::ExecutionError.new "Error updating user", extensions: meeting.errors.to_hash unless meeting.update(**args)

      { meeting: meeting }
    end
  end
end