class GamesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

  def index
    @games = Game.all

    @games = @games.where("location ILIKE ?", "%#{params[:location]}%") if params[:search]
    @games = @games.where("player_limit = ?", params[:player_limit]) if params[:player_limit]
    @games = @games.where("intensity ILIKE ?", "%#{params[:intensity]}%") if params[:intensity]

    @games = @games.order(date: :asc, time: :asc)

    render template: "games/index"
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
      title: params[:title],
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

    unless current_user && current_user.id == @game.user_id || current_user.admin
        render json: { errors: "Unauthorized to update this game" }, status: :unauthorized
        return
    end

    @game.update(
  {
    title: params[:title],
    location: params[:location],
    date: params[:date],
    time: params[:time],
    intensity: params[:intensity],
    player_limit: params[:player_limit],
    image_url: params[:image_url]
  }.compact
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
