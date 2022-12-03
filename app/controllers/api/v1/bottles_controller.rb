module Api
  module V1
    class BottlesController < ApplicationController
      def index
        render json: { bottles: Bottle.all }
      end
    end
  end
end
