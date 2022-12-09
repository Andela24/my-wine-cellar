
class WineriesController < ApplicationController
  
  def index
    @wineries = Winery.where(user_id: current_user.id)
    render json: @wineries, status: :ok
  end

  def show
    @winery = Winery.find_by(id: params[:id])
    render json: @winery, status: :ok
  end

  def create
    @winery = Winery.create(name: params[:winery_name], user_id: @current_user.id)
    render json: @winery, status: 201
  end
end