class UsersController < ApplicationController
  # before_action :authenticate_user

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
	  render :show
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      # username: params[:username],
      # pronouns: params[:pronouns],
      email: params[:email],
      # bio: params[:bio],
      # location: params[:location],
      # birthdate: params[:birthdate],
      # experience: params[:experience],
      password: params[:password],
      # password_confirmation: params[:password_confirmation]
    )
      if user.save
        render json: { message: "Welcome to the team, #{user.first_name}! 🎉" }
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
  end

  def update
    if current_user
      @user = User.find(params[:id])

      unless current_user.id == @user.id
        render json: { errors: "Unauthorized to update this user" }, status: :unauthorized
        return
      end

    @user.update(
			first_name: params["first_name"] || @user.first_name,
      last_name: params["last_name"] || @user.last_name,
      username: params["username"] || @user.username,
      pronouns: params["pronouns"] || @user.pronouns,
      bio: params["bio"] || @user.bio,
      location: params["location"] || @user.location,
	    experience: params["experience"] || @user.experience,
      # profile_image: params["profile_image"] || @user.profile_image
    )

    if @user.save #happy path
      render :show
    else #sad path
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  end

  def destroy
      unless current_user && current_user.id == params[:id].to_i
        render json: { errors: "Unauthorized to delete this account" }, status: :unauthorized
      end

      current_user.destroy
        render json: { message: "Your account was deleted." }

  end
end
