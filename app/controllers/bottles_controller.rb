class BottlesController < ApplicationController
  # before_action :authorize_user, only: [:update, :destroy]
  
  # get/ bottles
  def index
    @bottles = Bottle.where(user_id: @current_user.id)
    render json: @bottles, status: :ok
  end

  def create
    @bottle = Bottle.create(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage], user_id: @current_user.id, winery_id: params[:winery_id])
    if @bottle.save
      render json: @bottle, status: :created
    else
      render json: {message: 'Cannot create bottle' }, status: 422
    end
  end

  # GET/bottles:id
  def show
    bottle = Bottle.find_by(id: params[:id])
    render json: bottle, status: :ok
  end

   #PATCH/PUT/bottles/1
  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.user_id == @current_user.id
      @bottle.update(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage]) if @bottle.present?
      render json: {message: 'Updated successfully', error: false}, status: :ok
    else
      render json: {error: true}, status: :unauthorized
    end
  end

  
  def destroy
    @bottle = Bottle.find(params[:id])
    if @bottle.user_id == @current_user.id
      @bottle.destroy
      render json: {message: 'Deleted Successfully', error: false}, status: :ok
    else
      render json: {error: true}, status: :unauthorized
    end
  end
end

  # private 

  # def authorize_user
  #   permitted = current_user.id == @bottle.user_id
  #   render json: {errors:{User: "Failed to edit or destroy bottle"}}, status: :forbidden unless permitted
  # end
# end

