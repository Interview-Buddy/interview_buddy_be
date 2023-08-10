# frozen_string_literal: true

module Types
  class MeetingType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, String
    field :end_time, String
    field :interview_type, String
    field :student_id, Int
    field :user_id, Int
    field :date, String
    field :title, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
