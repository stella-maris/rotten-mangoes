class Admin::UsersController < ApplicationController
  before_filter :admin_only

  def index
  end

  # def login
  #   username = params[:username]
  #   password = params[:password]

  #   @user = User.find_by(username: username, password: password)
  #   if @user
  #     @user.admin = true
  #     redirect_to '/'
  #   else
  #     flash[:error] = "Invalid username/password"
  #     flash[:alert] = "You do not have permission to view this page"
  #     redirect_to '/login'
  #   end
  # end

end
