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
      argument :uuid, String, required: true
    end

    def user(uuid:)
      User.find_by(uuid: uuid)
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

    field :user_by_company, [Types::UserType], null: false do
      argument :company, String, required:true
    end

    def user_by_company(company:)
      User.where(company: company)
    end

    field :meetings_by_date, [Types::MeetingType], null: false do
      argument :date, String, required:true
    end

    def meetings_by_date(date:)
      Meeting.where(date: date)
    end

    field :meetings_by_user_and_month, [Types::MeetingType], null: false do
      argument :user_id, ID, required: true
      argument :month, String, required: true
    end

    def meetings_by_user_and_month(user_id:, month:)
      Meeting.where(user_id: user_id).where('extract(month from date) = ?', month)
    end

    field :meetings_by_student, [Types::MeetingType], null: false do
      argument :student_id, ID, required: true
    end

    def meetings_by_student(student_id:)
      Meeting.where(student_id: student_id)
    end

    field :meetings_by_student_and_month, [Types::MeetingType], null: false do
      argument :student_id, ID, required: true
      argument :month, String, required: true
    end

    def meetings_by_student_and_month(student_id:, month:)
      Meeting.where(student_id: student_id).where('extract(month from date) = ?', month)
    end

  end
end
