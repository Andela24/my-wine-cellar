module Api
  module V1
    class BottlesController < ApplicationController
      skip_before_action :authenticate_user

      def index
        @bottles = Bottle.all
        render json: @bottles, status: :ok
      end

      def create
        Bottle.create(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage])
      end

      def update
        @bottle = Bottle.find(params[:id])
        @bottle.update(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage]) if @bottle.present?
      end

      def destroy
        @bottle = Bottle.find(params[:id])
        @bottle.destroy
      end
    end
  end
end
