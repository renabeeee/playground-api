class RsvpsController < ApplicationController
  before_action :authenticate_user

  def index
    @rsvps = current_user.rsvps
    render :index
   end

  def show
    @rsvp = current_user.rsvps.find_by(id: params[:id])
    render :show
  end

  def create
    @rsvp = Rsvp.new(
      user_id: current_user.id,
      game_id: params[:game_id],
    )
      if @rsvp.save
        render json: { message: "You're in! " }
      else
        render json: { errors: [@rsvp.errors, "You're already RSVP'd to this game"], status: :unprocessable_entity }
      end
    end

    def destroy
        @rsvp = Rsvp.find(params[:id])
        @rsvp.destroy
        render json: { message: "You cancelled your rsvp." }
      end
end
