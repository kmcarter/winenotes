class UsersController < ApplicationController
  before_action :set_notes
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :authorize, only: [:new, :create]
  
  def index 
    @users = User.all
  end
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      if current_user.nil?
        UserMailer.thank_you(@user).deliver_now
        #sign_in(@user)
        #redirect_to @user, notice: "Welcome! Your account has been successfully created."
        redirect_to sign_in_path, notice: 'Welcome! Your account has been successfully created. Please login below.'
      else
        redirect_to @user, notice: 'User successfully created.'
      end
    else
      flash.now[:alert] = 'User was not created.'
      render :new
    end
  end
  
  def show
  end
  
  def edit 
  end
  
  def update 
    if @user.update(user_params)
      redirect_to @user, notice: 'User successfully updated.'
    else
      flash.now[:alert] = 'User was not updated.'
      render :edit
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_notes
      @notes = Note.where(user_id: params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end