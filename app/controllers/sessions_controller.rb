class SessionsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_valid

  before_action :require_logout, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        login @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        flash[:info] = "Hi #{@user.name}, welcome back to Docnect!"
        redirect_back_or @user
      else
        flash[:warning] = 'Account not activated, please check your emails for the activation link.'
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password.'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
