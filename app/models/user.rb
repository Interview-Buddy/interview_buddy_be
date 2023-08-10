class User < ApplicationRecord
  has_many :meetings
  validates_presence_of :first_name, :last_name, :user_type, :email 
  validates :email, uniqueness: true
  enum user_type: {"student" => 0, "alum" => 1, "admin" => 2}
end
