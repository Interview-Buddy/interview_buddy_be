class User < ApplicationRecord
  has_many :meetings, through: :user_meetings
end
