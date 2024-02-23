class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :users
end
