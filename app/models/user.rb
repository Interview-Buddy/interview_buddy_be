class User < ApplicationRecord
  has_many :meetings, through: :user_meetings
  enum user_type: {"student" => 0, "alum" => 1, "admin" => 2}
end
