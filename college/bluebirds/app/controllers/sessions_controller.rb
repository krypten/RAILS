class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = Login.find_by(username: params[:username])
    if user and Login.authenticate(params[:username], params[:password])
      session[:user_id] = user.User_id
      redirect_to root_url
    else
      redirect_to login_path, alert: "Invalid user/password combination"
    end
  end

  def change
  end

  def changed
    @login = Login.find_by(User_id: session[:user_id].to_i)
    puts(@login.username)
    if @login and @login.update(:username => @login.username, password_hash: params[:password].to_s, password_salt: @login.password_salt)
      redirect_to logout_path, notice: 'User Password changed and Please Re-Login'
    else
      redirect_to root_url, alert: "Error in updating password"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out"
  end

  def forget
  end

  def forgot
    @log = Login.find_by(username: params[:username])
    if @log
      Notifier.forgot(@log).deliver
      redirect_to root_url, notice: 'Email sent to registered email address'
    else 
      redirect_to login_path, notice: 'Not a valid username'
    end
  end
end 

