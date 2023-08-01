class Meeting < ApplicationRecord
  has_many :user_meetings
  has_many :users, through: :user_meetings
  enum interview_type: {"technical" => 0, "behavioral" => 1, "both" => 2}
  validates_presence_of :start_time, :end_time, :alum_id, :interview_type
end
