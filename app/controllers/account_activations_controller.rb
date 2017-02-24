class AccountActivationsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_valid

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      login user
      flash[:success] = 'Account activated, welcome to Docnect!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link.'
      redirect_to root_url
    end
  end
end
