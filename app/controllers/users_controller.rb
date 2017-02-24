class UsersController < ApplicationController
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
    if @user.user_group == 0
      params = user_params
    elsif @user.user_group == 1
      params = patient_params
    elsif @user.user_group == 2
      params = doctor_params
    end

    if params && @user.update_attributes(params)
      flash[:info] = 'Profile successfully updated!'
      if @user.user_group == 0
        redirect_to users_url
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
    redirect_to current_user unless current_user?(@user) || current_user.user_group == 0
  end

  def deny_super
    @user = User.find(params[:id])
    redirect_to edit_user_path(current_user) if current_user?(@user) && @user.user_group == 0
  end

  def require_logout
    if logged_in? && current_user.user_group != 0
      redirect_to current_user
    end
  end
end
