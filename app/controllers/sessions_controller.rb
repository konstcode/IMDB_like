class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to movies_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to movies_path
  end

end
