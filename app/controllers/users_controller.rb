class UsersController < ApplicationController
  # before_action :authenticate_user
  def store_google_data
    google_params = params

    @user = User.find_by(email: google_params[:email])


    if @user
      @user.update(
        first_name: google_params[:given_name],
        last_name: google_params[:family_name],
        profile_image: google_params[:picture],
        password: SecureRandom.hex(10),
      )

    else
      @user = User.create(
        first_name: google_params[:given_name],
        last_name: google_params[:family_name],
        email: google_params[:email],
        profile_image: google_params[:picture],
        password: SecureRandom.hex(10),
      )
    end
    render json: { user: @user }
end

  def show
    @user = User.find_by(id: params[:id])
  render :show
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      profile_image: params[:profile_image],
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
      profile_image: params["profile_image"] || @user.profile_image,
    )

    if @user.save #happy path
      render :show
    else #sad path
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  end

  def destroy
      @user = User.find(params[:id])

    unless current_user && current_user.id == params[:id].to_i
      render json: { errors: "Unauthorized to delete this account" }, status: :unauthorized
    @user.destroy
      render json: {message: "The user was deleted."}

    end
  end

      #   def send_password_reset
      #     user = User.find_by(email: params[:email])

      #     if user
      #       UserMailer.
      #       forgot_password(user).deliver_now
      #       render json: { message: "Password reset instructions sent to your email." }
      #     else
      #       render json: { errors: "No user found with that email address." }, status: :not_found
      #     end
      #   end

      #   def reset_password
      #     @user = User.find_by(password_reset_token: params[:token])

      #     if @user
      #       render :reset_password
      #     else
      #       render json: { errors: "Invalid or expired reset token." }, status: :unprocessable_entity
      #     end
      #   end

      #   def update_password
      #     @user = User.find_by(reset_password_token: params[:token])

      #     if @user&.update(password: params[:password])
      #       render json: { message: "Password successfully updated." }
      #     else
      #       render json: { errors: "Invalid or expired reset token." }, status: :unprocessable_entity
      #     end
      #   end
      end
