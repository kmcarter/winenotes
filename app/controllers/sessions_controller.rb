class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to landing_path, notice: "You have been signed out of the application!"
  end
end