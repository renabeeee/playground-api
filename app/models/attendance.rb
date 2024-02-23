class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :users

  # after_create :update_attendance_count
  after_destroy :update_attendance_count

  validates :user_id, uniqueness: { scope: :event_id }

  private

  def update_attendance_count
    event.update_attendance_count
  end
end
