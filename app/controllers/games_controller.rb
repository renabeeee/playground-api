class GamesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @games = Game.all
    render :index
  end

  def show
    @game = Game.find(params[:id])
	  render :show
  end

  def create
    if current_user
      @game = Game.new(
      user_id: current_user.id,
      location: params[:location],
      date: params[:date],
      time: params[:time],
      intensity: params[:intensity],
      player_limit: params[:player_limit],
      image_url: params[:image_url],
      description: params[:description],
  )
    if @game.save #happy path
      current_user.update(status: "Game Leader")
      render :show
    else #sad path
      render json: { errors: @game.errors.full_messages}, status: :unprocessable_entity
    end
    else
      render json: { message: "Please login." }, status: :unauthorized
    end
  end

  def update
    @game = Game.find(params[:id])

    unless current_user && current_user.id == @game.user_id
        render json: { errors: "Unauthorized to update this game" }, status: :unauthorized
        return
    end

    @game.update(
			description: params[:description],
      location: params[:location],
      date: params[:date],
      time: params[:time],
      intensity: params[:intensity],
      player_limit: params[:player_limit],
	    image_url: params[:image_url]
    )

      if @game.save #happy path
        render :show
      else #sad path
        render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
      end
    end

  def destroy
    @game = Game.find(params[:id])

    unless current_user && current_user.id == @game.user_id
      render json: { errors: "Unauthorized to delete this game" }, status: :unauthorized
      return
    end

    @game.destroy
    render json: {message: "Your game was deleted."}
  end
end
