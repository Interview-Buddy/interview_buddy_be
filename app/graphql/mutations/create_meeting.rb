module Mutations
  class CreateMeeting < Mutations::BaseMutation
    argument :start_time, String, required: true
    argument :end_time, String, required: true
    argument :interview_type, Integer, required: true
    argument :student_id, Integer, required: false
    argument :user_id, Integer, required: true
    argument :date, String, required: true
    argument :title, String, required: false

    field :meeting, Types::MeetingType, null: false
    field :errors, [String], null: false

    def resolve(start_time:, end_time:, interview_type:, student_id:, user_id:, date:, title:)
      alum = User.find(user_id)
      if alum.display_name
        new_title = "Interview with #{alum.display_name}"
      else
        new_title = "Interview with #{alum.first_name} #{alum.last_name}"
      end
      meeting = Meeting.new(start_time: start_time, end_time: end_time, interview_type: interview_type,
        student_id: student_id, user_id: user_id, date: date, title: new_title)
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
