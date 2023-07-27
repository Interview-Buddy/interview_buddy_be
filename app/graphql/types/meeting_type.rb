# frozen_string_literal: true

module Types
  class MeetingType < Types::BaseObject
    field :id, ID, null: false
    # field :start_time, Types::TimeType, null: false
    # field :end_time, Types::TimeType, null: false
    field :interview_type, String, null: false
    field :student, String, null: true
    field :alum, String, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
