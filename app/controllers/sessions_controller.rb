class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.find_by(username: params[:username])
    ##we have to store user in session
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      @user.update_attribute(:is_logedin, true)
      render json: @user, status: :created
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
