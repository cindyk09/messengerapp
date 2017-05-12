class UsersController < ApplicationController
  before_action :authenticate, only:[:show, :destroy]
  before_action :set_user, only:[:edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to chats_path
    else
      render :new
    end
  end

  def show
    @chats = Chat.all
    @users = User.all
  end


  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
