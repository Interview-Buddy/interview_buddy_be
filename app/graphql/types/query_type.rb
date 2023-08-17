module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false,
      description: "Return all users"
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id.to_i)
    end

    field :meetings, [Types::MeetingType], null: false,
      description: "Return all meetings"
    def meetings
      Meeting.all
    end

    field :meeting_by_user, [Types::MeetingType], null: false do
      argument :user_id, Int, required: true
    end

    def meeting_by_user(user_id:)
      Meeting.where(user_id: user_id)
    end

    field :meeting_by_interview_type, [Types::MeetingType], null: false do
      argument :interview_type, String, required: true
    end

    def meeting_by_interview_type(interview_type:)
      Meeting.where(interview_type: interview_type)
    end

  end
end
