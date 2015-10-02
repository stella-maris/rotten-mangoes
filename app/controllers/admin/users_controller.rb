class Admin::UsersController < ApplicationController
  before_filter :admin_only

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id #auto login
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
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
