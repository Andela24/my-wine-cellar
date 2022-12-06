module Api
  module V1
    class WineriesController < ApplicationController
      skip_before_action :authenticate_user
      before_action :set_winery, only: [:show, :update, :destroy]
      
      def index
        @wineries = Winery.all
        render json: @wineries, status: :ok
      end

      def create
        @winery = Winery.create(name: params[:winery_name])
        render json: @winery, status: 201
      end
    end
  end
end
