class GamesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @games = Game.all
    render :index
  end

  def show
    @game = Game.find_by(id: params[:id])
	  render :show
  end

  def create

    if current_user
      @game = Game.new(
      user_id: params[:user_id],
      location: params["location"],
      date: params["date"],
      time: params["time"],
      intensity: params["intensity"],
      player_limit: params["player_limit"],
      image_url: params["image_url"],
      description: params["description"],

  )
    if @game.save #happy path
      @game.status = "Game Leader"
      render :show
    else #sad path
      render json: { errors: @game.errors.full_messages}, status: :unprocessable_entity
    end
    else
      render json: { message: "Please login." }, status: :unauthorized
    end
  end

  def update
    if current_user
    @game = Game.find_by(id: params["id"])

    @game.update(
			description: params["description"] || @game.description,
      location: params["location"] || @game.location,
      date: params["date"] || @game.date,
      time: params["time"] || @game.time,
      intensity: params["intensity"] || @game.intensity,
      player_limit: params["player_limit"] || @game.player_limit,
	    image_url: params["image_url"] || @game.image_url
    )

    if @game.save #happy path
      render :show
    else #sad path
      render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
    end
  end

  def destroy
    if current_user

    game = Game.find_by(id: params["id"])
    game.destroy

    render json: {message: "Your game was deleted."}
    end
  end
end
