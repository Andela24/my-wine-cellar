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
    @bottle = @current_user.bottles.find(params[id])
    if @bottle.user_id == @current_user.id
    @bottle.update(bottle_params) if @bottle.present?
    render json: {message:'Updated succesfully', error: false}, status: :ok
    else 
      render json: {error: true}, status: :unauthorized
    end
  end
end

  
  def destroy
    @bottle = @current_user.bottles.find(params[:id])
    if @bottle.user_id == @current_user.id
    @bottle.destroy
    render json: { message: 'Deleted Successfully', error: false}, status: :ok
    else
      render json: {error: true}, status: :unauthorized
    end
  end
end

  private 
  
  def bottle_params
    params.permit(:title, :wine_type, :grape_variety, :vintage, :user_id, :winery_id)
end

end

