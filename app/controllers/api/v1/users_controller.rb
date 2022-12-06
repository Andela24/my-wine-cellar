module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        render json: { user: User.find(params[:id]) }
      end

      def create
        @user = User.create!(user_params)
        if @user.valid?
          
          session[:user_id] = @user.id
          render json: @user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:username, :password)
      end
    end
  end
end
