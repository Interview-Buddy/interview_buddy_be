module Mutations
  class CreateMeeting < Mutations::BaseMutation
    argument :start_time, String, required: true
    argument :end_time, String, required: true
    argument :interview_type, Integer, required: true
    argument :student_id, Integer, required: false
    argument :alum_id, Integer, required: true
    argument :date, String, required: true

    field :meeting, Types::MeetingType, null: false
    field :errors, [String], null: false

    def resolve(start_time:, end_time:, interview_type:, student_id:, alum_id:, date:)
      meeting = Meeting.new(start_time: start_time, end_time: end_time, interview_type: interview_type, 
        student_id: student_id, alum_id: alum_id, date: date)
      if meeting.save
        {
          meeting: meeting,
          errors: []
        }
      else
        {
          meeting: nil,
          errors: meeting.errors.full_messages
        }
      end
    end
  end
end