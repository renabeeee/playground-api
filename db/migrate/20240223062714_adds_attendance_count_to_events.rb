class AddsAttendanceCountToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :attendance_count, :integer, default: 0
  end
end
