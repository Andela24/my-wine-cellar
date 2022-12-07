module Api
  module V1
    class WineriesController < ApplicationController
      
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
