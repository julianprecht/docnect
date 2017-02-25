class UsersController < ApplicationController
  include ActionView::Helpers::TextHelper

  # Catch user record not found exception
  rescue_from ActiveRecord::RecordNotFound, :with => :user_not_found
  def user_not_found
    if logged_in?
      redirect_to current_user
    else
      redirect_to root_url
    end
  end

  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_valid, only: [:new, :create, :edit, :update, :destroy]

  before_action :require_logout, only: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :deny_super, only: [:show]
  before_action :permit_user_group, only: [:show]
  before_action :require_super, only: [:destroy_inactive]

  def index
    case current_user.user_group
      when 0
        @users = User.all.where(activated: true).paginate(page: params[:page], :per_page => 20)
        @title = 'All Users'
      when 2
        # Change to only include patients of current doctor
        @users = User.all.where(user_group: 1, activated: true).paginate(page: params[:page], :per_page => 20)
        @title = 'Your Patients'
      else
        @users = User.all.where(user_group: 2, activated: true).paginate(page: params[:page], :per_page => 20)
        @title = 'All Doctors'
    end
  end

  def show
    @user = User.find(params[:id])
    @age = nil
    if @user.dob
      now = Time.zone.now
      @age = now.year - @user.dob.year - (@user.dob.to_time.change(:year => now.year) > now ? 1 : 0)
    end

    @diagnosis = diagnosis_of(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Set random password for new doctors, also set user group
    if logged_in?
      random = User.new_token
      @user.password = random
      @user.password_confirmation = random
      @user.user_group = 2
    end

    if @user.save
      @user.send_activation_email
      if logged_in?
        flash[:info] = "#{@user.name} has been sent an email with information to activate their account!"
        redirect_to new_user_path
      else
        flash[:info] = 'Please check your emails to activate your account!'
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    params = nil
    if @user.group?(0)
      params = user_params
    elsif @user.group?(1)
      params = patient_params
    elsif @user.group?(2)
      params = doctor_params
    end

    if params && @user.update_attributes(params)
      flash[:info] = 'Profile successfully updated!'
      if @user.group?(0)
        redirect_to users_path
      else
        redirect_to @user
      end
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = 'Account successfully deleted.'
    if logged_in?
      redirect_to users_url
    else
      redirect_to root_url
    end
  end

  def destroy_inactive
    @inactive = User.all.where(activated: false)
    count = @inactive.count
    @inactive.each do |inactive|
      inactive.destroy
    end
    if count > 0
      flash[:info] = "#{pluralize(count, 'inactive account')} successfully deleted."
    else
      flash[:info] = 'No inactive accounts exist to be deleted.'
    end
    redirect_to users_url
  end

private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def patient_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :dob, :nationality, :marital_status, :occupation, :hobbies, :languages, :height, :weight, :allergies, :smoke, :alcohol, :tattoos, :history, :medication, :drugs, :illness)
  end

  def doctor_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :specialization, :phone, :address, :bio)
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user) || current_user.group?(0)
  end

  def deny_super
    @user = User.find(params[:id])
    if current_user?(@user) && @user.group?(0)
      redirect_to edit_user_path(current_user)
    elsif @user.group?(0)
      redirect_to current_user
    end
  end

  def require_logout
    if logged_in? && !current_user.group?(0)
      redirect_to current_user
    end
  end

  def require_super
    redirect_to current_user unless current_user.group?(0)
  end

  def permit_user_group
    @user =  User.find(params[:id])
    unless current_user.group?(0) || current_user?(@user) || (@user.group?(2) && current_user.group?(1)) || (@user.group?(1) && current_user.group?(2))
      redirect_to current_user
    end
  end
end
