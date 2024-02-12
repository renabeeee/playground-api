class PasswordController < ApplicationController
def create
        user = User.find_by(email: params[:email])
        if user
          token = SecureRandom.hex(32)

          user.update(reset_token: token, reset_token_sent_at: Time.current)

          UserMailer.with(user: user).password_reset.deliver_now

          render json: { message: 'Password reset email sent.' }, status: :ok
        else
          render json: { error: 'User not found.' }, status: :not_found
        end
      end

      def edit
        user = User.find_by(reset_token: params[:token])

        if user && user.reset_token_sent_at > 1.hour.ago
          # Token is valid
          render json: { user_id: user.id }, status: :ok
        else
          render json: { error: 'Invalid or expired token.' }, status: :bad_request
        end
      end

      def update
        user = User.find(params[:user_id])

        if user.update(password: params[:password], reset_token: nil, reset_token_sent_at: nil)
          render json: { message: 'Password reset successful.' }, status: :ok
        else
          render json: { error: 'Unable to reset password.' }, status: :unprocessable_entity
        end
      end
    end
