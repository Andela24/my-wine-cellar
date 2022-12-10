
class BottlesController < ApplicationController

  def index
    @bottles = Bottle.where(user_id: @current_user.id)
    render json: @bottles, status: :ok
  end

  def create
    @bottle = Bottle.create(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage], user_id: @current_user.id, winery_id: params[:winery_id])
    render json: @bottle, status: :created
  end

  def show
    @bottle = Bottle.find_by(id: params[:id])
    render json: @bottle, status: :ok
  end

  def update
    @bottle = Bottle.find(params[:id])
    @bottle.update(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage]) if @bottle.present?
  end

  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    render json: { message: 'Deleted Successfully'}, status: :ok
  end
end

