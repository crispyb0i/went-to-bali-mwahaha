class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
       flash[:success] = "Signed in successfully!"
      redirect_to '/'
    else
      flash[:error] = "Invalid email or password."
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sign_in'
    flash[:success] = "You have signed out successfully!"
  end

end
