class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    elsif user
      flash.now.alert = "Password invalid. Account enumeration: Flag{UTRIAUB6AXWT8ED}"
      render "new" 
    else
      flash.now.alert = "Email/Password invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end