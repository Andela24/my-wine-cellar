module Api
  module V1
    class WineriesController < ApplicationController
      def index
        render json: { wineries: Winery.all }
      end
    end
  end
end
