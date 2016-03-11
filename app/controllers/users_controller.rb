class UsersController < ApplicationController
  before_action :set_notes
  before_action :set_user, only: [:show, :edit, :update]
  
  def index 
    @users = User.all
  end
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.thank_you(@user).deliver_now
      redirect_to @user, notice: 'User successfully created.'
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