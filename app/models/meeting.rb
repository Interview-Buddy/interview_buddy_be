class Meeting < ApplicationRecord
  has_many :users, through: :user_meetings
end
