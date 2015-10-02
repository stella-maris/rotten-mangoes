class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && !user.admin #this guy is only a user
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    elsif user && user.authenticate(params[:password]) && user.admin #this guy is a admin
      session[:user_id] = user.id
      session[:admin] = user.id  
      redirect_to movies_path, notice: "Welcome admin #{user.firstname}"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Bye-bye"
  end

end

# redirect_to admin_users_path