# frozen_string_literal: true

module Types
  class MeetingType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, String
    field :end_time, String
    field :interview_type, Integer
    field :student_id, Integer
    field :alum_id, Integer
    field :date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
