class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    
    if user&.authenticate(params[:password])
      user.update_attribute(:is_logedin, true)
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: ["Username or Password did not match."] }, status: :unauthorized
    end
  end

  def destroy
    user = User.find(params[:id])
    user.update(is_logedin: false)
    render json: { errors: ["Successfully logged out"]}, status: :ok
  end
end
