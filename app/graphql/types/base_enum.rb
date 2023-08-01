module Types
  class BaseEnum < GraphQL::Schema::Enum
  end
end

class Types::InterviewType < Types::BaseEnum
  value "technical"
  value "behavioral"
  value "both"
end