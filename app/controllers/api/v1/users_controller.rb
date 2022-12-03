module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: { users: User.all }
      end
    end
  end
end
