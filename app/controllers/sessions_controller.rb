class SessionsController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create, :destroy]

  def new
      @user = User.new
  end

  def create
      user = User.authenticate!(params[:user][:email], params[:user][:password])
      if user
        session[:user_id] = user.id
        redirect_to chats_path
      else
        flash[:error] = "Bad E-mail or Password"
        redirect_to login_path
      end
    end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def login(user)
    session[:user_id] = nil
  end
end
