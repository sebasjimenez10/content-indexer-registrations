module API
  module V1
    class RegistrationsController < ApplicationController
      def sign_up
        user = User.new(user_params)

        if user.save
          render json: { user: user }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :password)
      end
    end
  end
end
