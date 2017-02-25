class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include QuestionsHelper

  # Ensure user is logged in before accessing any pages within the site
  before_action :require_login
  before_action :require_valid

  # Redirects to login page if not logged in on page access
  def require_login
    unless logged_in?
      store_location
      flash[:warning] = 'Please login to continue.'
      redirect_to login_url
    end
  end

  def require_valid
    unless current_user.valid?
      flash[:warning] = 'Please complete your profile before continuing.'
      redirect_to edit_user_path(current_user)
    end
  end
end
