class SessionsController < ApplicationController
  before_filter :require_user, :only => [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      render :root
    else
      render :new
    end  
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
end