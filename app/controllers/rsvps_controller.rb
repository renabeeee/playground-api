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
    @game = Game.find(params[:game_id])

    @rsvp = Rsvp.new(
      user_id: current_user.id,
      game_id: @game.id,
      )
    if @rsvp.save
      render json: { message: "You're in! " }
      else
      render json: { errors: [@rsvp.errors, "You're already RSVP'd to this game"], status: :unprocessable_entity }
    end
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])

    if @rsvp.user == current_user
      @rsvp.destroy
      render json: { message: "You cancelled your RSVP." }
    else
      render json: { error: "You are not authorized to delete this RSVP." }, status: :unauthorized
    end
  end
end
