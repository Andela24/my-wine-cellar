class BottlesController < ApplicationController

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


   #PATCH/PUT/bottles/1
  def update
    @bottle = Bottle.find(params[:id])
    @bottle.update(title: params[:title], wine_type: params[:wineType], grape_variety: params[:grapeVariety], vintage: params[:vintage]) if @bottle.present?
  end

  
  def destroy
    
    @bottle = @current_user.bottles.find(params[:id])
    # render errors
    #not authorized if not logged in
    @bottle.destroy
    render json: { message: 'Deleted Successfully'}, status: :ok
  end

  # private
  # # Only allow a list of trusted parameters through.
  # def bottles_params
  #   params.permit
  # end

end

