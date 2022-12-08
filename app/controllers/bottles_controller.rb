
class BottlesController < ApplicationController

  def index
    @bottles = Bottle.all
    render json: @bottles, status: :ok
  end

  def create
    Bottle.create(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage], user_id: User.last.id, winery_id: params[:winery_id])
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

