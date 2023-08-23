class Meeting < ApplicationRecord
  belongs_to :user
  enum interview_type: {"technical" => 0, "behavioral" => 1, "both" => 2}
  validates_presence_of :start_time, :end_time, :user_id, :interview_type, :date, presence: true
end
