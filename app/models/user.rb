class User < ApplicationRecord
  has_many :meetings, dependent: :delete_all
  validates_presence_of :first_name, :last_name, :user_type, :email, :uuid 
  validates :email, uniqueness: true
  validates :uuid, uniqueness: true
  enum user_type: {"student" => 0, "alum" => 1, "admin" => 2}
end
