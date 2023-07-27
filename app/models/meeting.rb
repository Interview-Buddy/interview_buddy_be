class Meeting < ApplicationRecord
  has_many :users, through: :user_meetings
  enum interview_type: {"technical" => 0, "behavioral" => 1, "both" => 2}
end
