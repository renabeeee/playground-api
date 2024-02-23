class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances

  def attendance_count
    attendances.count
  end

  def update_attendance_count
    update(attendance_count: attendances.count)
  end

  validates :name, :description, :date, :time, :location, presence: true

end
