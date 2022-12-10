
class WineriesController < ApplicationController
  
  def index
    @wineries = Winery.all
    render json: @wineries, status: :ok
  end

  def my_wineries
    @wineries = @current_user.wineries
    render json: @wineries, status: :ok
  end

  def show
    @winery = Winery.find_by(id: params[:id])
    render json: @winery, status: :ok
  end

  def create
    @winery = Winery.new(name: params[:winery_name])
    if @winery.save
      render json: @winery, status: 201
    else
      render json: { message: "Failed to create winery" }, status: 422
    end
  end
end