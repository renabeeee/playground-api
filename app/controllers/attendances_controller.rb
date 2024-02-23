class AttendancesController < ApplicationController

  def index
    @attendances = current_user.attendances
    render :index
   end

   def create
    @event = Event.find(params[:event_id])

    @attendance = Attendance.new(
      user_id: current_user.id,
      event_id: @event.id,
      )
      if @attendance.save
        render json: { message: "You're going to "}
      else
        render json: { errors: [@attendance.errors, "You're already RSVP'd to this event"], status: :unprocessable_entity }
      end
    end

end
