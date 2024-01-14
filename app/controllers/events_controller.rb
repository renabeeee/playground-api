class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @events = Event.all

    @events = @events.where("location ILIKE ?", "%#{params[:location]}%") if params[:search]
    @events = @events.where("date ILIKE ?", "%#{params[:date]}%") if params[:date]

    @events = @events.order(date: :asc, time: :asc)

    render template: "events/index"
  end

  def show
    @event = Event.find(params[:id])
	  render :show
  end

  def create
    if current_user
      @event = Event.new(
      user_id: current_user.id,
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      date: params[:date],
      time: params[:time],
      location: params[:location],
   )
    if @event.save #happy path
      render json: { message: "Event posted!" }, status: :unauthorized
    else #sad path
      render json: { errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
    end
  end

  def update
    @event = Event.find(params[:id])

    unless current_user && current_user.id == @event.user_id
        render json: { errors: "Unauthorized to update this event" }, status: :unauthorized
        return
    end

    @event.update(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      date: params[:date],
      time: params[:time],
      location: params[:location],
    )

      if @event.save #happy path
        render :show
      else #sad path
        render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
      end
    end

  def destroy
    @event = Event.find(params[:id])

    unless current_user && current_user.id == @event.user_id
      render json: { errors: "Unauthorized to delete this game" }, status: :unauthorized
      return
    end

    @event.destroy
    render json: {message: "Your event was deleted."}
  end
end
