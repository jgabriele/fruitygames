class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
  	user = User.authenticate(params[:pseudo], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in !"
  	else
  		flash.now.alert = "Invalid email or password"
      redirect_to root_url
  	end
  end
  
  def destroy
  		session[:user_id] = nil
  		redirect_to root_url, :notice => "Logged out successfully"
  end
end
