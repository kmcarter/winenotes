class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
    flash.now[:alert] = warden.message if warden.message.present?
    @user = User.new
  end
  
  def create
    warden.authenticate!
    redirect_to root_url, notice: "Logged in!"
  end
  
  def destroy
    reset_session
    redirect_to sign_in_path, notice: "You have been signed out of the application! You can sign in again below."
  end
end