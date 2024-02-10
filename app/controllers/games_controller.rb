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
      title: params[:title],
      location: params[:location],
      date: params[:date],
      time: params[:time],
      intensity: params[:intensity],
      player_limit: params[:player_limit],
      image_url: params[:image_url],
  )
  @game.image_url.attach(params[:image]) # Attach the uploaded image

    if @game.save #happy path
      Rsvp.create(user: current_user, game: @game)
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
    @game.image_url.attach(params[:image]) if params[:image] # Update if a new image is uploaded


#     @game.update(
#   {
#     title: params[:title],
#     location: params[:location],
#     date: params[:date],
#     time: params[:time],
#     intensity: params[:intensity],
#     player_limit: params[:player_limit],
#     image_url: params[:image_url]
#   }.compact
# )
updated_fields = {}
  updated_fields[:title] = params[:title] unless params[:title].blank?
  updated_fields[:location] = params[:location] unless params[:location].blank?
  updated_fields[:date] = params[:date] unless params[:date].blank?
  updated_fields[:time] = params[:time] unless params[:time].blank?
  updated_fields[:intensity] = params[:intensity] unless params[:intensity].blank?
  updated_fields[:player_limit] = params[:player_limit] unless params[:player_limit].blank?
  updated_fields[:image_url] = params[:image_url] unless params[:image_url].blank?

  # Add validation checks here if needed

  @game.update(updated_fields)
      if @game.save #happy path
        render :show
      else #sad path
        render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def destroy
    @game = Game.find(params[:id])

    unless current_user && current_user.id == @game.user_id || current_user.admin
      render json: { errors: "Unauthorized to delete this game" }, status: :unauthorized
      return
    end

    @game.destroy
    render json: {message: "Your game was deleted."}
  end
end
