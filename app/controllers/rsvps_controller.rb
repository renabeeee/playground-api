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
    @rsvp = Rsvp.new(user_id: current_user.id, game_id: params[:game_id])


    if @rsvp.save
      render json: { message: "You're in! You're going to #{game.name} on #{game.date} at #{game.time}" }
    else
      render json: { errors: @rsvp.errors.full_messages }, status: :unprocessable_entity
    end
  end

    def destroy
      @rsvp = Rsvp.find_by(user_id: current_user.id, game_id: params[:game_id])
      @rsvp.destroy
        render json: { message: "You've un-rsvp'd to this game." }
    end
end
