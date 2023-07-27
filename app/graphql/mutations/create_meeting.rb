module Mutations
  class CreateMeeting < Mutations::BaseMutation
    argument :start_time, Time, required: true
    argument :end_time, Time, required: true
    argument :interview_type, Integer, required: true
    argument :student, String, required: false
    argument :alum, String, required: true
    argument :date, Date, required: true
  end
end